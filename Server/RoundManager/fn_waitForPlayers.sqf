private ["_tmpPlayers","_readyPlayers","_start"];

waitUntil { 
    sleep .5;
    _tmpPlayers = playableUnits;//[] call BIS_fnc_listPlayers;
    _readyPlayers = 0;
    _start = false;
    {
        if (_x getVariable ["INF_ClientReady",false]) then {
            _readyPlayers = _readyPlayers + 1;
        };
    } forEach INFS_CurrentPlayers;
    
    if (_readyPlayers >= INFS_minPlayers) then {
        _start = true;
    };
    _start
};