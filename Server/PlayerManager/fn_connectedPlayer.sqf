params ["_id","_uid","_name","_jip","_owner"];

_client = objectFromNetId _uid;
{
    _client setVariable [_x,0,true];
} forEach INFS_ScoreVars;

_client spawn INFS_fnc_setupPlayer;
[] call INFS_fnc_updateTeams;