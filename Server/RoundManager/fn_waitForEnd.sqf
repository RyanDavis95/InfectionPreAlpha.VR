private ["_handle"];

waitUntil {
    sleep .5;
    [] call INFS_fnc_updateTeams;
    if (INFS_Zombies isEqualTo [] && !INFS_PickingZom) then {
        remoteExec ["INFD_fnc_zombieMessage",INFS_CurrentPlayers,false];
        _handle = [] spawn INFS_fnc_pickAlpha;
        waitUntil { scriptDone _handle; };          
    };  

    (count INFS_Survivors == 0 || count INFS_CurrentPlayers < INFS_minPlayers)
};