diag_log "Round Status - Started";

INF_GameInProgress = true;
[] spawn {
  waitUntil {sleep 1; [] call INFS_fnc_updateTeams; count INF_Survivors == 0}; 

  INF_GameInProgress = false;
  diag_log "Round Status - Ended";
};