params ["_corpse","_client"];

_corpse setVariable ["INF_DisplayIcon",true,true];
_corpse setVariable ["INF_IconTime",serverTime,true];
_corpse setVariable ["INF_IconType","DEAD",true];
_corpse setVariable ["INF_IconText",name _client,true];
_client setVariable ["INF_IconTexture", INF_MissionRoot + "Resources\Images\dead_CA.paa",true];