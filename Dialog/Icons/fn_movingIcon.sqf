params ["_client"];

_client setVariable ["INF_DisplayIcon",true,true];
_client setVariable ["INF_IconTime",serverTime,true];
_client setVariable ["INF_IconType","MOVING",true];
_client setVariable ["INF_IconTexture", INF_MissionRoot + "Resources\Images\testTriangle_CA.paa",true];