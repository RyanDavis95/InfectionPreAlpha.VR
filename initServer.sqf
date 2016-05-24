if (isServer) then {
    diag_log "****************************************";
    diag_log "Infection Server - Starting Server";
    _handle = [] execVM "Server\init.sqf";
    waitUntil { scriptDone _handle; };
    diag_log "Infection Server - Initialization Complete";
    diag_log "****************************************";
};

INF_ServerStarted = True;

missionNamespace setVariable ["INF_ServerStarted", INF_ServerStarted, true];