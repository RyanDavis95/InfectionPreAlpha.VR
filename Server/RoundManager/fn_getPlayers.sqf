_minPlayers = getNumber (missionConfigFile >> "INF_Settings" >> "minPlayers");

waitUntil { _start = false;
    INF_CurrentPlayers = [] call BIS_fnc_listPlayers;
    if(count INF_CurrentPlayers >= _minPlayers) then {           
        "Starting Match" remoteExec ["Hint",0,false];
        _start = true;
    } else {
        "Waiting for more players..." remoteExec ["Hint",0,false];
        sleep 1;
    };
    _start
};
        