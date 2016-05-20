[] spawn {
    while {true} do {
        INF_RoundNumber = INF_RoundNumber + 1;
        diag_log format ["----Starting Round %1----",INF_RoundNumber];  
             
        diag_log "Round System - Cleaning Up World";
        [] call INFS_fnc_resetWorld;
        diag_log "Round System - World Reset";

        diag_log "Round System - Assigning Players";
        _handle = [] spawn INFS_fnc_setupTeams;
        waitUntil { scriptDone _handle; };
        diag_log "Round System - Players Assigned";
        
        diag_log "Round System - Setting up Zone";
        _zone = [] call INFS_fnc_setupZone;       
        diag_log "Round System - Zone Ready";
        
        diag_log "Round System - Starting Round";
        [] call INFS_fnc_startRound;
        diag_log "Round System - Round Started";      
        
        waitUntil { INF_RoundEnded; };      
    };
};