diag_log "Round Status - Started";

_minPlayers = getNumber (missionConfigFile >> "INF_Settings" >> "minPlayers");
INF_GameInProgress = true;
_minPlayers spawn {
  waitUntil {
        sleep 1; 
        if (!INF_initJIP) then {
          [] call INFS_fnc_updateTeams;
        };
        if (INF_Zombies isEqualTo [] && INF_GameInProgress && !INF_PickingZom) then {
            [] call INFS_fnc_pickAlpha;
        }; 
        (count INF_Survivors == 0 || count INF_CurrentPlayers < _this)
      }; 

  INF_GameInProgress = false;
  diag_log "Round Status - Ended";
};