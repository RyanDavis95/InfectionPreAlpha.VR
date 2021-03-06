params ["_client"];

{
    _client setVariable [_x,0,true];
} forEach INFS_Settings_ScoreVars;

waitUntil {sleep .05; _client getVariable ["INF_Client_Ready",false]};
if (!INFS_Round_InProgress) then {
    _client remoteExec ["INF_fnc_initSurvivor",_client,false];
} else {
    _client remoteExec ["INF_fnc_initZombie",_client,false];
};

_client remoteExec ["INF_fnc_spawnPlayer",_client,false];

if (missionNamespace getVariable "INF_GameInProgress") then {
    _client enableSimulationGlobal true;
} else {
    _client enableSimulationGlobal false;  
};

[] call INFS_fnc_updateTeams;