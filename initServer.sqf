if (isServer) then {
    INFS_ServerStarted = False;
    diag_log "****************************************";
    diag_log "Infection Server - Starting Server";
    _handle = [] execVM "Server\init.sqf";
    waitUntil { scriptDone _handle; };
    diag_log "Infection Server - Initialization Complete";
    diag_log "****************************************";
    INFS_ServerStarted = True;
    missionNamespace setVariable ["INF_ServerStarted", INFS_ServerStarted, true];
    

    {
        _x spawn INFS_fnc_setupPlayer;
    } forEach allUnits;

};