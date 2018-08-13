sleep 1;


_jeep_test = createVehicle [ "Jeep", [7920.04,9776.73,0.166302], [], 0, "NONE"];
_person_test = createUnit ["B_RangeMaster_F", [7920.90,9776.00,0.166302], [], 0, "FORM"];


_camera = "camera" camcreate[7918.35,9840.29,61.3812];
_camera cameraeffect["Internal","Back"];

showcinemaBorder false;

_camera camPrepareTarget [7920.04,9776.73,0.166302];
_camera camPreparePos [7918.35,9840.29,61.3812];
_camera camPrepareFOV 0.740;
_camera camCommitPrepared 0;

sleep 5;

screenshot "test_1.png";

sleep 5;

_camera camPrepareTarget [7920.04,9776.73,0.166302];
_camera camPreparePos [7869.40,9779.16,61.3812];
_camera camPrepareFOV 0.740;
_camera camCommitPrepared 1;

sleep 5;

screenshot "test_2.png";

sleep 5;

_camera camPrepareTarget [7920.04,9776.73,0.166302];
_camera camPreparePos [7922.85,9703.96,61.3812];
_camera camPrepareFOV 0.740;
_camera camCommitPrepared 1;

sleep 5;

screenshot "test_3.png";

sleep 5;

_camera camPrepareTarget [7920.04,9776.73,0.166302];
_camera camPreparePos [7977.43,9776.30,61.3812];
_camera camPrepareFOV 0.740;
_camera camCommitPrepared 1;

sleep 5;

screenshot "test_4.png";

sleep 5;

_camera cameraeffect ["Terminate","Back"];

camDestroy _camera;
