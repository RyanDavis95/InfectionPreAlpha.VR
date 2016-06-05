while {true} do {
    
    INFS_Round_StartTime = serverTime;
    INFS_Round_Number = INFS_Round_Number + 1;
    diag_log format ["----Starting Round %1----",INFS_Round_Number];  

    diag_log "Round System - Cleaning Up World";
    [] call INFS_fnc_resetWorld;
    diag_log "Round System - World Reset";

    diag_log "Round System - Setting up Zone";
    [] call INFS_fnc_setupZone;       
    diag_log "Round System - Zone Ready";

    diag_log "Round System - Intermission Started";
    [] call INFS_fnc_startIntermission;
    diag_log "Round System - Intermission Ended";

    diag_log "Round System - Starting Round";
        _handle = [] spawn INFS_fnc_startRound;
        waitUntil { scriptDone _handle; };
    diag_log "Round System - Round Started";    
        
    diag_log "----Round Ended: "+str((serverTime-INFS_Round_StartTime)/60)+" Minutes----";
            /* Start New Round */
    waitUntil {sleep 1; !INFS_Round_InProgress};
    sleep 10;
    
};
