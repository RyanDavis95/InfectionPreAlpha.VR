INFS_GameInProgress = true;
diag_log "Round Status - Started";

[] spawn {
    waitUntil {
        
        if (INFS_JIPQueue isEqualTo [] && INFS_Zombies isEqualTo [] && INFS_GameInProgress 
        && !INFS_PickingZom) then {
            
            [] call INFS_fnc_updateTeams;
            _handle = [] spawn INFS_fnc_pickAlpha;
            waitUntil { scriptDone _handle; };
        };
        sleep 1; 
        (count INFS_Survivors == 0 || count INFS_CurrentPlayers < INF_minPlayers)
    }; 

  INF_GameInProgress = false;
  diag_log "Round Status - Ended";
};