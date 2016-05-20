diag_log "Round Status - Started";
INF_RoundEnded = false;

[] spawn {
  waitUntil {sleep 1; [] call INFS_fnc_updateTeams; count INF_Survivors == 0}; 

  INF_RoundEnded = true;
  diag_log "Round Status - Ended";
};