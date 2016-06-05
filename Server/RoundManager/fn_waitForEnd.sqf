private ["_handle"];

waitUntil {
    sleep .5;
    _endRound = false;
    
    [] call INFS_fnc_updateTeams;
       
    if (INFS_Zombies isEqualTo [] && !INFS_Round_PickingZombie) then {
        remoteExec ["INFD_fnc_zombieMessage",INFS_Lists_Players,false];
        _handle = [] spawn INFS_fnc_pickAlpha;
        waitUntil { scriptDone _handle; };     
    };
    
    if (count INFS_Lists_Players < INFS_Settings_MinPlayers) then {
        hint "Not enough players";
        _handle = [] spawn INFS_fnc_waitForPlayers;
        waitUntil { scriptDone _handle; };
    };
        
    if (count INFS_Lists_Survivors == 0) then {
        remoteExec ["INFD_fnc_survivorsEliminated",INFS_Lists_Players,false];
        _endRound = true;
    } else {
        
        if ((serverTime - INFS_Round_StartTime) >= INFS_Settings_TimeLimit) then {
            hint "Survivors Win!";
            _endRound = true;
        };           
    };      
    _endRound
};