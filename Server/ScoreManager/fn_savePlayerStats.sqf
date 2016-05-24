params ["_client"];
private ["_value","_cVal"];

{
    INF_Stat = _x;
    INF_Val = _client getVariable _x;
    INF_Player = _client;
    
    {
        _val = profileNamespace getVariable [INF_Stat,0];
        profileNamespace setVariable [INF_Stat, INF_Val + _val];
        INF_Player globalChat format ["%1",profileNamespace getVariable [INF_Stat,0]];
    } remoteExec ["BIS_fnc_call",INF_Player,false];
    
    _client setVariable [_x,0];
    
} forEach INFS_ScoreVars;

INF_Stat = "";
INF_Val = 0;