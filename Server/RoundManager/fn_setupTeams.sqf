{
    [_x,"SURVIVOR"] call INFS_fnc_setTeam;
    _x remoteExec ["INF_fnc_initSurvivor",_x,false];    
} forEach INFS_CurrentPlayers;

[] call INFS_fnc_updateTeams;
