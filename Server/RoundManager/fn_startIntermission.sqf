{
    _handle = _x spawn INFS_fnc_savePlayerStats;
    waitUntil { scriptDone _handle; };
    
} forEach INF_CurrentPlayers;

_time = serverTime + 30;

waitUntil { sleep .2; 

    ("Restart in: "+ str round (_time - serverTime)) remoteExecCall ["hint",0,false];
    
    if (serverTime >= _time) then {
        "" remoteExecCall ["hint",0,false];
    };
    (serverTime >= _time)
};
