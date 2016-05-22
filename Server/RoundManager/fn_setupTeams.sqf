private ["_alpha"];

{
    [_x,"SURVIVOR"] call INFS_fnc_setTeam;
    _x remoteExec ["INF_fnc_initSurvivor",_x,false];    
} forEach INF_CurrentPlayers;

[] call INFS_fnc_updateTeams;

[] call INFS_fnc_pickAlpha;
