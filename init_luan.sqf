sleep 1;

//creates the camera in normal mode
_camera = "camera" camcreate[0 ,0,0];
_camera cameraeffect["Internal","Back"];
showcinemaBorder false;

//creates target point and circle around it
targ_x=10078;
targ_y=10085;
targ_z=0;
radius=40;
x_low=targ_x-radius;
x_high=targ_x+radius;
y_low=targ_y-radius;
y_high=targ_y+radius;

//side and squad for all people in the scenario
_testBluforHQ = createCenter west;
_groupAlpha = createGroup [west, true];
_groupBeta = createGroup [west, true];
_person_reference_list = [];
_vehicle_reference_list = [];

//creates people?
for [{_i = 1}, {_i<6}, {_i=_i+1}] do
{
  _person =_groupAlpha createUnit ["B_RangeMaster_F", [x_low+ random (x_high-x_low), y_low+ random (y_high-y_low),0], [], 0, "FORM"];
  _person_reference_string = ["person_", _i] joinString "";
  _person_reference_list pushBack _person_reference_string;
  missionNamespace setVariable [_person_reference_string, _person];
};

//creates a vehicle
/* truck_1 = createVehicle [ "C_Offroad_02_unarmed_F", [x_low+random (x_high-x_low), y_low+random (y_high-y_low),0], [], 0, "NONE"];
truck_1 setVehicleTIPars [1,1,1]; */

for [ {_i = 1}, {_i<3}, {_i=_i+1}] do
{
  _vehicle = [[x_low + random (x_high - x_low), y_low _ random (y_high - y_low), 0], random [0, 180, 360], "C_Offroad_02_unarmed_F", _groupBeta] call BIS_fnc_spawnVehicle;
  _vehicle_reference_string = ["vehicle_", _i] joinString "";
  _vehicle_reference_list pushBack _vehicle_reference_string;
  missionNamespace setVariable [_vehicle_reference_string, _vehicle];
};

_groupAlpha addWaypoint [[targ_x,targ_y,targ_z],radius];
_camera camPrepareTarget [targ_x,targ_y,targ_z];

//positions camera on circle created above and looks at the people in the scene
phi= 75;
theta= 0;
_camera camPreparePos [targ_x + radius*(sin phi)*(cos theta) ,targ_y + radius*(sin phi)*(sin theta),radius* (cos phi)];
_camera camPrepareFOV 0.740;
_camera camCommitPrepared 0;
annot="";
sleep 1;
setAccTime 0;
copyToClipboard "ARMA3";
uisleep 2;
concat="";

//Luan's get cooridinates and paste to clipboard thing
{
  s = format ["%1", _x];
  split= s splitString "_";
  _screenPos = worldToScreen position _x;
  _screenX = _screenPos select 0;
  _screenY = _screenPos select 1;
  _myX = (_screenX - safeZoneXAbs) / (safeZoneWAbs);
  _myY = (_screenY - safeZoneY) / (safeZoneH);
  string= format [ "%1 %2", round (_myX * (getResolution select 0)), round (_myY * (getResolution select 1)) ];
  concat= [concat, split select 0] joinString ",";
  concat= [concat, string] joinString ":";
} forEach [person_1, person_2, person_3, person_4, person_5, truck_1];


{
  _person_reference = missionNamespace getVariable _x;
  _person_reference hideObjectGlobal true
} forEach _person_reference_list;

copyToClipboard "ARMA3";
uisleep 2;

{
  _person_reference = missionNamespace getVariable _x;
  _person_reference hideObjectGlobal false
} forEach _person_reference_list;

  true setCamUseTI 0;
  copyToClipboard "ARMA3";
  uisleep 2;
  false setCamUseTI 0;
  setAccTime 1;
  center=["image_1", concat] joinString "=";
  annot=[annot, center] joinString ",";
  sleep 2;

  //positions camera on circle created above and looks at the people in the scene
  _phi= 75;
  _theta= 90;
  _camera camPreparePos [(targ_x + radius*(sin _phi)*(cos _theta)) ,(targ_y + radius*(sin _phi)*(sin _theta)),radius* (cos _phi)];
  _camera camCommitPrepared 1;
  uisleep 2;
  setAccTime 0;
  copyToClipboard "ARMA3";
  uisleep 2;
  concat="";

//Luan's get cooridinates and paste to clipboard thing
{
  s = format ["%1", _x];
  split= s splitString "_";
  _screenPos = worldToScreen position _x;
  _screenX = _screenPos select 0;
  _screenY = _screenPos select 1;
  _myX = (_screenX - safeZoneXAbs) / (safeZoneWAbs);
  _myY = (_screenY - safeZoneY) / (safeZoneH);
  string= format [ "%1 %2", round (_myX * (getResolution select 0)), round (_myY * (getResolution select 1)) ];
  concat= [concat, split select 0] joinString ",";
  concat= [concat, string] joinString ":";
} forEach [person_1, person_2, person_3, person_4, person_5, truck_1];


true setCamUseTI 0;
copyToClipboard "ARMA3";
uisleep 2;
false setCamUseTI 0;
setAccTime 1;
center=["image_2", concat] joinString "=";
annot=[annot, center] joinString ",";
sleep 2;

//positions camera on circle created above and looks at the people in the scene
phi= 75;
theta= 180;
_camera camPreparePos [targ_x + radius*(sin phi)*(cos theta) ,targ_y + radius*(sin phi)*(sin theta),radius* (cos phi)];
_camera camCommitPrepared 1;
uisleep 2;
setAccTime 0;
copyToClipboard "ARMA3";
uisleep 2;
concat="";

//Luan's get cooridinates and paste to clipboard thing
{
  s = format ["%1", _x];
  split= s splitString "_";
  _screenPos = worldToScreen position _x;
  _screenX = _screenPos select 0;
  _screenY = _screenPos select 1;
  _myX = (_screenX - safeZoneXAbs) / (safeZoneWAbs);
  _myY = (_screenY - safeZoneY) / (safeZoneH);
  string= format [ "%1 %2", round (_myX * (getResolution select 0)), round (_myY * (getResolution select 1)) ];
  concat= [concat, split select 0] joinString ",";
  concat= [concat, string] joinString ":";
} forEach [person_1, person_2, person_3, person_4, person_5, truck_1];

{
  _x hideObjectGlobal true
} forEach [person_1, person_2, person_3, person_4, person_5, truck_1];

copyToClipboard "ARMA3";
uisleep 2;

{
  _x hideObjectGlobal false
} forEach [person_1, person_2, person_3, person_4, person_5, truck_1];

true setCamUseTI 0;
copyToClipboard "ARMA3";
uisleep 2;
false setCamUseTI 0;
setAccTime 1;
center=["image_3", concat] joinString "=";
annot=[annot, center] joinString ",";
copyToClipboard annot;

//positions camera on circle created above and looks at the people in the scene
phi= 75;
theta= 270;
_camera camPreparePos [targ_x + radius*(sin phi)*(cos theta) ,targ_y + radius*(sin phi)*(sin theta),radius* (cos phi)];
_camera camCommitPrepared 1;
uisleep 2;
setAccTime 0;
copyToClipboard "ARMA3";
uisleep 2;
concat="";

//Luan's get cooridinates and paste to clipboard thing
{
  s = format ["%1", _x];
  split= s splitString "_";
  _screenPos = worldToScreen position _x;
  _screenX = _screenPos select 0;
  _screenY = _screenPos select 1;
  _myX = (_screenX - safeZoneXAbs) / (safeZoneWAbs);
  _myY = (_screenY - safeZoneY) / (safeZoneH);
  string= format [ "%1 %2", round (_myX * (getResolution select 0)), round (_myY * (getResolution select 1)) ];
  concat= [concat, split select 0] joinString ",";
  concat= [concat, string] joinString ":";
} forEach [person_1, person_2, person_3, person_4, person_5, truck_1];

{
  _x hideObjectGlobal true
} forEach [person_1, person_2, person_3, person_4, person_5, truck_1];

copyToClipboard "ARMA3";
uisleep 2;

{
  _x hideObjectGlobal false
} forEach [person_1, person_2, person_3, person_4, person_5, truck_1];

true setCamUseTI 0;
copyToClipboard "ARMA3";
uisleep 2;
false setCamUseTI 0;

setAccTime 1;
_camera cameraeffect ["Terminate","Back"];
camDestroy _camera;
