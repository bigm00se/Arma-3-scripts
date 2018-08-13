sleep 1;

//creates a jeep and a person and assigns them to a group as needed
_testBluforHQ = createCenter west;
_groupAlpha = createGroup [west, true];
_jeep_test = createVehicle [ "C_Offroad_02_unarmed_F", [7920.04,9776.73,0.166302], [], 0, "NONE"];
_person_test = _groupAlpha createUnit ["B_RangeMaster_F", [7920.04,9776.73,0.166302], [], 0, "FORM"];

//creates the camera in normal mode
_camera = "camera" camcreate[7918.35,9840.29,61.3812];
_camera cameraeffect["Internal","Back"];
showcinemaBorder false;

//prepares the camera for where it will positioned and what to look at
_camera camPrepareTarget [7920.04,9776.73,0.166302];
_camera camPreparePos [7918.35,9840.29,61.3812];
_camera camPrepareFOV 0.740;
_camera camCommitPrepared 0;

_groupAlpha addWaypoint [[7920.04,9776.73,0.166302], 10];

sleep 2;

//takes the screenshot in EO and IR(white-hot)
setAccTime 0;
screenshot "test_EO_1.png";
true setCamUseTI 0;
screenshot "test_IR_1.png";
false setCamUseTI 0;
setAccTime 1;

sleep 2;

_camera camPrepareTarget [7920.04,9776.73,0.166302];
_camera camPreparePos [7869.40,9779.16,61.3812];
_camera camPrepareFOV 0.740;
_camera camCommitPrepared 1;

_groupAlpha addWaypoint [[7920.04,9776.73,0.166302], 10];

sleep 2;

setAccTime 0;
screenshot "test_EO_1.png";
true setCamUseTI 0;
screenshot "test_IR_1.png";
false setCamUseTI 0;
setAccTime 1;

sleep 2;

_camera camPrepareTarget [7920.04,9776.73,0.166302];
_camera camPreparePos [7922.85,9703.96,61.3812];
_camera camPrepareFOV 0.740;
_camera camCommitPrepared 1;

_groupAlpha addWaypoint [[7920.04,9776.73,0.166302], 10];

sleep 2;

setAccTime 0;
screenshot "test_EO_1.png";
true setCamUseTI 0;
screenshot "test_IR_1.png";
false setCamUseTI 0;
setAccTime 1;

sleep 2;

_camera camPrepareTarget [7920.04,9776.73,0.166302];
_camera camPreparePos [7977.43,9776.30,61.3812];
_camera camPrepareFOV 0.740;
_camera camCommitPrepared 1;

_groupAlpha addWaypoint [[7920.04,9776.73,0.166302], 10];

sleep 2;

setAccTime 0;
screenshot "test_EO_1.png";
true setCamUseTI 0;
screenshot "test_IR_1.png";
false setCamUseTI 0;
setAccTime 1;

sleep 2;

//destroys the camera

_camera cameraeffect ["Terminate","Back"];

camDestroy _camera;
