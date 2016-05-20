diag_log "Round Status - Started";
INF_RoundEnded = false;

missionNamespace setVariable ["INF_RoundEnded", INF_RoundEnded,true];
[] spawn {
  waitUntil {sleep 1; [] call INFS_fnc_updateTeams; count INF_Survivors == 0}; 

  INF_RoundEnded = true;
  missionNamespace setVariable ["INF_RoundEnded", INF_RoundEnded,true];
  diag_log "Round Status - Ended";
};