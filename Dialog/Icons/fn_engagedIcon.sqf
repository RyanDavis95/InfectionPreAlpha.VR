params ["_victim","_client"];

if (_client getVariable "INF_Team" != _victim getVariable "INF_Team") then {
    _client setVariable ["INF_DisplayIcon",true,true];
    _client setVariable ["INF_IconTime",serverTime,true];
    _client setVariable ["INF_IconType","ENGAGED",true];
    _client setVariable ["INF_IconTexture", INF_MissionRoot + "Resources\Images\testTriangle_CA.paa",true];
};
