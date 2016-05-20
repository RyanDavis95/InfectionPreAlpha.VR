params ["_player"];

INF_ScoreVars = ["INF_pXP","INF_pKills","INF_pDeaths"];
{
    _player setVariable [_x,0,true];
} forEach INF_ScoreVars;