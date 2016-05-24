waitUntil { _start = false;
    INFS_CurrentPlayers = [] call BIS_fnc_listPlayers;
    if(count INFS_CurrentPlayers >= INFS_minPlayers) then {           
        "Starting Match" remoteExec ["Hint",0,false];
        _start = true;
    } else {
        "Waiting for more players..." remoteExec ["Hint",0,false];
        sleep 1;
    };
    _start
};
        