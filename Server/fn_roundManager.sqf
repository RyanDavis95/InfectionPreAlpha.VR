[] spawn {
    while {true} do {
        INF_RoundNumber = INF_RoundNumber + 1;
        diag_log format ["----Starting Round %1----",INF_RoundNumber];  
        
        diag_log "Round System - Intermission Started";
        [] call INFS_fnc_startIntermission;
        diag_log "Round System - Intermission Ended";
        
        diag_log "Round System - Cleaning Up World";
        [] call INFS_fnc_resetWorld;
        diag_log "Round System - World Reset";
        
        diag_log "Round System - Queueing Players";
        _ready = [] spawn INFS_fnc_getPlayers;
        waitUntil { scriptDone _ready; };
        diag_log "Round System - Players Queued";
        
        diag_log "Infection Server - Setup Stat System";
        [] call INFS_fnc_setupStats;
        diag_log "Infection Server - Stats Initialized";
        
        diag_log "Round System - Assigning Players";
        [] call INFS_fnc_setupTeams;
        diag_log "Round System - Players Assigned";
        
        diag_log "Round System - Setting up Zone";
        [] call INFS_fnc_setupZone;       
        diag_log "Round System - Zone Ready";
        
        diag_log "Round System - Starting Round";
        [] call INFS_fnc_startRound;
        diag_log "Round System - Round Started";      
        diag_log "----------------------------";
        
                /* Start New Round */
        waitUntil {sleep 1; !INF_GameInProgress};
        
    };
};