private ["_minPlayers"];

_minPlayers = getNumber (missionConfigFile >> "INF_Settings" >> "minPlayers");
INF_GameInProgress = true;
diag_log "Round Status - Started";

_minPlayers spawn {
    waitUntil {
        if (!INF_initJIP) then {
          [] call INFS_fnc_updateTeams;
        };
        if (INF_Zombies isEqualTo [] && INF_GameInProgress && !INF_PickingZom) then {
            _handle = [] spawn INFS_fnc_pickAlpha;
            waitUntil { scriptDone _handle; };
        };
        sleep 1; 
        (count INF_Survivors == 0 || count INF_CurrentPlayers < _this)
    }; 

  INF_GameInProgress = false;
  diag_log "Round Status - Ended";
};