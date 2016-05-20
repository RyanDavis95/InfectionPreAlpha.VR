params ["_player"];
private ["_value","_cVal"];

{
    _value = _player getVariable _x;
    {
        _cVal = profileNamespace getVariable [_x,0];
        profileNamespace setVariable [_x,_value + _cVal];
    } remoteExec ["BIS_fnc_call",INF_CurrentPlayers,false];
    
    _player setVariable [_x,0];
    
} forEach INF_ScoreVars;