params ["_player"];
private ["_value","_cVal"];

{
    player globalchat _x;
    _value = _player getVariable _x;
    //_value + _cVal
    {
        profileNamespace getVariable ["PlayerDeaths",0];
        profileNamespace setVariable ["PlayerDeaths",0];
    } remoteExec ["BIS_fnc_call",INF_CurrentPlayers,false];
    
    _player setVariable [_x,0];
    
} forEach INF_ScoreVars;