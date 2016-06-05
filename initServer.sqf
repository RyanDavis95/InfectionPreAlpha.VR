if (isServer) then {
    INFS_Settings_ServerStarted = False;
    diag_log "****************************************";
    diag_log "Infection Server - Starting Server";
    _handle = [] execVM "Server\init.sqf";
    waitUntil { scriptDone _handle; };
    diag_log "Infection Server - Initialization Complete";
    diag_log "****************************************";
    INFS_Settings_ServerStarted = True;
    missionNamespace setVariable ["INF_ServerStarted", INFS_Settings_ServerStarted, true];
    

    {
        _x spawn INFS_fnc_setupPlayer;
    } forEach allUnits;

};