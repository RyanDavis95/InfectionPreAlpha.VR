params ["_player"];

INF_ScoreVars = getArray (missionConfigFile >> "INF_Settings" >> "playerStats");

{
    _player setVariable [_x,0,true];
} forEach INF_ScoreVars;