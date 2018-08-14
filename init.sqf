sleep 10;

//creates a jeep and a person and assigns them to a group as needed
_testBluforHQ = createCenter west;
_groupAlpha = createGroup [west, true];
_jeep_test = createVehicle [ "C_Offroad_02_unarmed_F", [7920.04,9776.73,0.166302], [], 0, "NONE"];
_jeep_test setVehicleTIPars [1,1,1];
_person_test = _groupAlpha createUnit ["B_RangeMaster_F", [7920.04,9776.73,0.166302], [], 0, "FORM"];

//creates the camera in normal mode
_camera = "camera" camcreate[7918.35,9840.29,61.3812];
_camera cameraeffect["Internal","Back"];
showcinemaBorder false;

//creates post-processing effects
_color_correction = ppEffectCreate ["ColorCorrection", 1501];
_color_correction ppEffectEnable true;
_color_correction ppEffectAdjust [0.7, 1.3, 0, [0,0,0,0], [1,1,1,0], [1,1,1,0]];
_color_correction ppEffectCommit 1;

//setLightBrightness 30;
//setAperture 60;


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
uisleep 1;
_color_correction ppEffectEnable true;
_color_correction ppEffectAdjust [0.7, 1.3, 0, [0,0,0,0], [1,1,1,0], [1,1,1,0]];
_color_correction ppEffectCommit 1;
true setCamUseTI 0;
uisleep 1;
screenshot "test_IR_1.png";
uisleep 1;
false setCamUseTI 0;
_color_correction ppEffectenable false;
setAccTime 1;

sleep 2;

_camera camPrepareTarget [7920.04,9776.73,0.166302];
_camera camPreparePos [7869.40,9779.16,61.3812];
_camera camPrepareFOV 0.740;
_camera camCommitPrepared 1;

_groupAlpha addWaypoint [[7920.04,9776.73,0.166302], 10];

sleep 2;

setAccTime 0;
screenshot "test_EO_2.png";
uisleep 1;
_color_correction ppEffectEnable true;
_color_correction ppEffectAdjust [0.7, 1.3, 0, [0,0,0,0], [1,1,1,0], [1,1,1,0]];
_color_correction ppEffectCommit 1;
true setCamUseTI 0;
uisleep 1;
screenshot "test_IR_2.png";
uisleep 1;
false setCamUseTI 0;
_color_correction ppEffectenable false;
setAccTime 1;

sleep 2;

_camera camPrepareTarget [7920.04,9776.73,0.166302];
_camera camPreparePos [7922.85,9703.96,61.3812];
_camera camPrepareFOV 0.740;
_camera camCommitPrepared 1;

_groupAlpha addWaypoint [[7920.04,9776.73,0.166302], 10];

sleep 2;

setAccTime 0;
screenshot "test_EO_3.png";
uisleep 1;
true setCamUseTI 0;
0 setOvercast 0.7;
uisleep 1;
screenshot "test_IR_3.png";
uisleep 1;
false setCamUseTI 0;
0 setOvercast 0;
setAccTime 1;

sleep 2;

_camera camPrepareTarget [7920.04,9776.73,0.166302];
_camera camPreparePos [7977.43,9776.30,61.3812];
_camera camPrepareFOV 0.740;
_camera camCommitPrepared 1;

_groupAlpha addWaypoint [[7920.04,9776.73,0.166302], 10];

sleep 2;

setAccTime 0;
screenshot "test_EO_4.png";
uisleep 1;
true setCamUseTI 0;
0 setOvercast 0.7;
uisleep 1;
screenshot "test_IR_4.png";
uisleep 1;
false setCamUseTI 0;
0 setOvercast 0;
setAccTime 1;

sleep 2;

//destroys the camera and post-processing effects
ppEffectDestroy _color_correction;
_camera cameraeffect ["Terminate","Back"];

camDestroy _camera;
