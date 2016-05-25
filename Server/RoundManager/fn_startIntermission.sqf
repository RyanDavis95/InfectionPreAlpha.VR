{
    _x spawn INFS_fnc_savePlayerStats;
} forEach INFS_CurrentPlayers;

_time = serverTime + INFS_IntermissionTime;

waitUntil { sleep .2; 

    ("Restart in: "+ str round (_time - serverTime)) remoteExecCall ["hint",0,false];
    
    if (serverTime >= _time) then {
        "" remoteExecCall ["hint",0,false];
    };
    (serverTime >= _time)
};
