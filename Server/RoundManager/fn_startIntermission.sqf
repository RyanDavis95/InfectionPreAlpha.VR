{
    _x call INFS_fnc_savePlayerStats;
    
} forEach INF_CurrentPlayers;

_time = serverTime + 30;

waitUntil { sleep .25; 

    ("Restart in: "+ str round (_time - serverTime)) remoteExecCall ["hint",0,false];
    
    if (serverTime >= _time) then {
        "" remoteExecCall ["hint",0,false];
    };
    (serverTime >= _time)
};
