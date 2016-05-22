params ["_player"];
private ["_value","_cVal"];

{
    INF_Stat = _x;
    INF_Val = _player getVariable _x;
    INF_Player = _player;
    
    {
        _val = profileNamespace getVariable [INF_Stat,0];
        profileNamespace setVariable [INF_Stat, INF_Val + _val];
        INF_Player globalChat format ["%1",profileNamespace getVariable [INF_Stat,0]];
    } remoteExec ["BIS_fnc_call",INF_Player,false];
    
    _player setVariable [_x,0];
    
} forEach INF_ScoreVars;

INF_Stat = "";
INF_Val = 0;