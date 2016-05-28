INFS_GameInProgress = True;
missionNamespace setVariable ["INF_GameInProgress",true,true];
diag_log "Round Status - Started";

[] spawn {
    
    waitUntil {
        [] call INFS_fnc_updateTeams;
        if (INFS_JIPQueue isEqualTo [] && INFS_Zombies isEqualTo [] && INFS_GameInProgress 
        && !INFS_PickingZom) then {
            remoteExec ["INFD_fnc_zombieMessage",INFS_CurrentPlayers,false];
            _handle = [] spawn INFS_fnc_pickAlpha;
            waitUntil { scriptDone _handle; };          
        };  

        sleep 1;
        (count INFS_Survivors == 0 || count INFS_CurrentPlayers < INFS_minPlayers)
    };
  INFS_GameInProgress = False;
  missionNamespace setVariable ["INF_GameInProgress",false,true];
  
  if (count INFS_Survivors == 0) then {
      remoteExec ["INFD_fnc_survivorsEliminated",INFS_CurrentPlayers,false];
  }; 
  diag_log "Round Status - Ended";
};