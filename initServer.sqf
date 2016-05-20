if (isServer) then {
    diag_log "****************************************";
    diag_log "Infection Server - Starting Server";
    _handle = [] execVM "Server\init.sqf"; //call compile preprocessFileLineNumbers
    waitUntil { scriptDone _handle; };
    diag_log "Infection Server - Initialization Complete";
    diag_log "****************************************";
};

INF_ServerStarted = True;