/* Wait for Sufficient # of players */
_handle = [] spawn INFS_fnc_waitForPlayers;
waitUntil { scriptDone _handle; };

/* Start the Round */
INFS_GameInProgress = True;
missionNamespace setVariable ["INF_GameInProgress",true,true];
diag_log "Round Status - Started";

/* Check if round-end conditions met */
_handle = [] spawn INFS_fnc_waitForEnd;
waitUntil { scriptDone _handle; };

/* Display Round End Message TODO: (Add more messages )*/
if (count INFS_Survivors == 0) then {
    remoteExec ["INFD_fnc_survivorsEliminated",INFS_CurrentPlayers,false];
}; 

/* End Round */
INFS_GameInProgress = False;
missionNamespace setVariable ["INF_GameInProgress",false,true];
diag_log "Round Status - Ended";