uiSleep 1;

// Asset
//creates target point and circle around it
camera_target_list = [[7500, 7500, 0],[10000, 10000, 0],[4000, 10000, 0]];
radius = 30;

//positions camera on circle created above and looks at the people in the scene
phi= 75;
theta= [0, 90, 180, 270];

//creates the camera in normal mode
thermal_load_time = 0.5;
camera_snap_wait_time = 0.2;
amount_of_persons = 12;
amount_of_vehicles = 3;

//list of vehicles
_vehicle_list = [ "C_Offroad_02_unarmed_F", "B_APC_Wheeled_01_cannon_F", "B_G_Van_01_transport_F", "B_MRAP_01_F", "B_Truck_01_transport_F", "B_Truck_01_Repair_F", "    C_Offroad_01_repair_F", "C_Truck_02_transport_F", "C_Hatchback_01_F", "C_Van_01_box_F", "    C_Offroad_01_F"];

//list of people
_person_list = ["C_man_polo_1_F", "C_man_polo_2_F", "C_man_polo_5_F_afro", "    C_man_hunter_1_F", "    B_Soldier_F", "    B_Soldier_TL_F", "    B_engineer_F", "B_Soldier_unarmed_F", "B_recon_F", "B_CTRG_soldier_AR_A_F", "B_G_Soldier_SL_F", "I_G_Story_SF_Captain_F"];

//list to hide
_secret_club_list = [];

_camera = "camera" camcreate[0 ,0,0];
_camera cameraeffect["Internal","Back"];
showcinemaBorder false;

//side and squad for all people in the scenario
_testBluforHQ = createCenter west;
_group_labels = ["person", "truck"];
_groupAlpha = createGroup [west, true];
_groupBeta = createGroup [west, true];
_person_reference_list = [];
_vehicle_reference_list = [];
_set_counter = 0;

//creates people
{
  camera_target = _x;
  x_low = (camera_target select 0) - radius;
  x_high = (camera_target select 0) + radius;
  y_low = (camera_target select 1) - radius;
  y_high = (camera_target select 1) + radius;

  for [{_i = 1}, {_i < amount_of_persons}, {_i=_i+1}] do
  {
    _person =_groupAlpha createUnit [selectRandom(_person_list), [x_low+ random (x_high-x_low), y_low+ random (y_high-y_low),0], [], 0, "FORM"];
    _person_reference_string = ["person_", _i] joinString "";
    _person_reference_list pushBack _person_reference_string;
    missionNamespace setVariable [_person_reference_string, _person];
  };

  //creates vehicles
  for [ {_i = 1}, {_i < amount_of_vehicles}, {_i=_i+1}] do
  {
    _vehicle = createVehicle [ selectRandom(_vehicle_list), [x_low+random (x_high-x_low), y_low+random (y_high-y_low),0], [], 0, "NONE"];
    createVehicleCrew _vehicle;
    _vehicle setVehicleTIPars [1,1,1];
    _vehicle_reference_string = ["truck_", _i] joinString "";
    _vehicle_reference_list pushBack _vehicle_reference_string;
    missionNamespace setVariable [_vehicle_reference_string, _vehicle];
  };

  _groupAlpha addWaypoint [[(camera_target select 0),(camera_target select 1),camera_target select 2],radius];
  _groupBeta addWaypoint [[(camera_target select 0),(camera_target select 1),camera_target select 2],radius];
  _camera camPrepareTarget [(camera_target select 0),(camera_target select 1),camera_target select 2];

  //loop for taking the three screenshots
  {
    _camera camPreparePos [(camera_target select 0) + radius*(sin phi)*(cos _x) ,(camera_target select 1) + radius*(sin phi)*(sin _x),radius* (cos phi)];
    _camera camPrepareFOV 0.740;
    _camera camCommitPrepared 0;
    annot = "";

    //thermal image
    true setCamUseTI 0;
    setAccTime 1;
    uiSleep thermal_load_time;
    setAccTime 0;
    uiSleep camera_snap_wait_time;
    copyToClipboard "ARMA3-Capture";
    uiSleep camera_snap_wait_time;
    false setCamUseTI 0;
    concat= ["set_", _set_counter] joinString "";

    //Luan's get cooridinates and paste to clipboard thing
    {
      _person_reference = missionNamespace getVariable _x;
      s = format ["%1", _person_reference];
      label = _group_labels select 0;
      _screenPos = worldToScreen position _person_reference;
      _screenX = _screenPos select 0;
      _screenY = _screenPos select 1;
      _myX = (_screenX - safeZoneXAbs) / (safeZoneWAbs);
      _myY = (_screenY - safeZoneY) / (safeZoneH);
      string = format [ "%1 %2", round (_myX * (getResolution select 0)), round (_myY * (getResolution select 1)) ];
      concat = [concat, label] joinString ",";
      concat = [concat, string] joinString ":";
    } forEach _person_reference_list;

    {
      _vehicle_reference = missionNamespace getVariable _x;
      s = format ["%1", _vehicle_reference];
      label = _group_labels select 1;
      _screenPos = worldToScreen position _vehicle_reference;
      _screenX = _screenPos select 0;
      _screenY = _screenPos select 1;
      _myX = (_screenX - safeZoneXAbs) / (safeZoneWAbs);
      _myY = (_screenY - safeZoneY) / (safeZoneH);
      string = format [ "%1 %2", round (_myX * (getResolution select 0)), round (_myY * (getResolution select 1)) ];
      concat = [concat, label] joinString ",";
      concat = [concat, string] joinString ":";
    } forEach _vehicle_reference_list;

      //color image
      uiSleep camera_snap_wait_time;
      copyToClipboard "ARMA3-Capture";
      uiSleep camera_snap_wait_time;
      center = ["image_1", concat] joinString "=";
      annot = [annot, center] joinString ",";

    {
      _person_reference = missionNamespace getVariable _x;
      _person_reference hideObjectGlobal true;
    } forEach _person_reference_list;

    {
      _vehicle_reference = missionNamespace getVariable _x;
      _vehicle_reference hideObjectGlobal true;
    } forEach _vehicle_reference_list;

    //background image
    uiSleep camera_snap_wait_time;
    copyToClipboard "ARMA3-Capture";
    uiSleep camera_snap_wait_time;

    {
      _person_reference = missionNamespace getVariable _x;
      _person_reference hideObjectGlobal false;
    } forEach _person_reference_list;

    {
      _vehicle_reference = missionNamespace getVariable _x;
      _vehicle_reference hideObjectGlobal false;
    } forEach _vehicle_reference_list;

    //loops to add assets to secret list
    {
      _secret_club_list pushBack _x;
    } forEach in _person_reference_list;

    {
      _secret_club_list pushBack _x;
    } forEach in _vehicle_reference_list;

    //loop to hide objects individually from secret list
    {
      _current = _x;

      {
        if(_current != _X) then {
            _x hideObjectGlobal true;
        };

        uiSleep camera_snap_wait_time;
        copyToClipboard "ARMA3-Capture";
        uiSleep camera_snap_wait_time;

      } forEach in _secret_club_list;
    } forEach in _secret_club_list;

    concat = ["ARMA3-Label", concat] joinString "=";
    _set_counter = _set_counter + 1;
    uiSleep camera_snap_wait_time;
    copyToClipboard concat;
    uiSleep camera_snap_wait_time;

  } forEach theta;
} forEach camera_target_list;
uiSleep camera_snap_wait_time;
copyToClipboard "ARMA3-Complete";

setAccTime 1;
_camera cameraeffect ["Terminate","Back"];
camDestroy _camera;
