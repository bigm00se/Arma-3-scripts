sleep 1;
//creates the camera in normal mode
_camera = "camera" camcreate[10053.7,10102.3,50];
_camera cameraeffect["Internal","Back"];
showcinemaBorder false;
truck_1 setVehicleTIPars [1,1,1];
//prepares the camera for where it will positioned and what to look at
_camera camPrepareTarget [10078,10085,0];
_camera camPreparePos [10053.7,10102.3,50];
_camera camPrepareFOV 0.740;
_camera camCommitPrepared 0;
annot="";
sleep 1;
//takes the screenshot in EO and IR(white-hot)
setAccTime 0;
copyToClipboard "ARMA3";
uisleep 2;
concat="";
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
{_x hideObjectGlobal true} forEach [person_1, person_2, person_3, person_4, person_5, truck_1];
copyToClipboard "ARMA3";
uisleep 2;
{_x hideObjectGlobal false} forEach [person_1, person_2, person_3, person_4, person_5, truck_1];
/* screenshot "test_EO_1.png"; */
true setCamUseTI 0;
copyToClipboard "ARMA3";
uisleep 2;
/* screenshot "test_IR_1.png"; */
/* uisleep 1; */
false setCamUseTI 0;
setAccTime 1;
center=["image_1", concat] joinString "=";
annot=[annot, center] joinString ",";
sleep 2;
_camera camPreparePos [10060,10150,50];
_camera camCommitPrepared 1;
uisleep 2;
setAccTime 0;
copyToClipboard "ARMA3";
uisleep 2;
concat="";
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
{_x hideObjectGlobal true} forEach [person_1, person_2, person_3, person_4, person_5, truck_1];
copyToClipboard "ARMA3";
uisleep 2;
{_x hideObjectGlobal false} forEach [person_1, person_2, person_3, person_4, person_5, truck_1];
/* screenshot "test_EO_1.png"; */
true setCamUseTI 0;
copyToClipboard "ARMA3";
uisleep 2;
/* screenshot "test_IR_1.png"; */
/* uisleep 1; */
false setCamUseTI 0;
setAccTime 1;
center=["image_2", concat] joinString "=";
annot=[annot, center] joinString ",";
_camera camPreparePos [10040,10075,25];
_camera camCommitPrepared 1;
uisleep 2;
setAccTime 0;
copyToClipboard "ARMA3";
uisleep 2;
concat="";
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
{_x hideObjectGlobal true} forEach [person_1, person_2, person_3, person_4, person_5, truck_1];
copyToClipboard "ARMA3";
uisleep 2;
{_x hideObjectGlobal false} forEach [person_1, person_2, person_3, person_4, person_5, truck_1];
/* screenshot "test_EO_1.png"; */
true setCamUseTI 0;
copyToClipboard "ARMA3";
uisleep 2;
/* screenshot "test_IR_1.png"; */
/* uisleep 1; */
false setCamUseTI 0;
setAccTime 1;
center=["image_3", concat] joinString "=";
annot=[annot, center] joinString ",";
copyToClipboard annot;
