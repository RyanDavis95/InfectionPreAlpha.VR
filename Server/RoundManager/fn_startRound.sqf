/* Wait for Sufficient # of players */
_handle = [] spawn INFS_fnc_waitForPlayers;
waitUntil { scriptDone _handle; };

/* Start the Round */
INFS_Round_InProgress = True;
missionNamespace setVariable ["INF_GameInProgress",true,true];
diag_log "Round Status - Started";

/* Check if round-end conditions met */
_handle = [] spawn INFS_fnc_waitForEnd;
waitUntil { scriptDone _handle; };

/* End Round */
INFS_Round_InProgress = False;
missionNamespace setVariable ["INF_GameInProgress",false,true];
diag_log "Round Status - Ended";