params ["_id","_uid","_name","_jip","_owner"];

_client = objectFromNetId _uid;

{
    _client setVariable [_x,0,true];
} forEach INFS_ScoreVars;

_client spawn {
    _client = _this;
    waitUntil {sleep 1; _client getVariable ["INF_ClientReady",false]};
    if (!INFS_GameInProgress) then {
        _client remoteExec ["INF_fnc_initSurvivor",_client,false];
    } else {
        _client remoteExec ["INF_fnc_initZombie",_client,false];
    };

    _client remoteExec ["INF_fnc_spawnPlayer",_client,false];
    _client enableSimulationGlobal true;
};