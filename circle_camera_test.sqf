_radius = 50;
_angle = 180;
_altitude = 60;
_dir = 0; //0: anti-clockwise, 1: clockwise
_speed = 0.2;
Camrunning = true;

_coordinates = [player, _raduis, _angle] call BIS_fnc_relPos;
_coordinates set [2, _altitude];

//creates the camera in normal mode
_camera = "camera" camcreate _coordinates;
_camera cameraeffect["Internal","Back"];
showcinemaBorder false;
_camera camPrepareFOV 0.740;
_camera camPrepareTarget player;
_camera camCommitPrepared 0;

while {Camrunning} do {
    _coordinates = [player, _radius, _angle] call BIS_fnc_relPos;
    _coordinates set [2, _altitude];

    _camera camPreparePos _coordinates;
    _camera camCommitPrepared _speed;

    waitUntil {camCommitted _camera || !(Camrunning)};

    _camera camPreparePos _coordinates;
    _camera camCommitPrepared 0;

    _angle = if (_dir == 0) then {_angle -1} else {_angle +1};
};
