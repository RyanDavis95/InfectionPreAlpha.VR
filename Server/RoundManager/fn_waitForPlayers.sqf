private ["_tmpPlayers","_readyPlayers","_start"];

waitUntil { 
    sleep .5;
    _tmpPlayers = playableUnits;//[] call BIS_fnc_listPlayers;
    _readyPlayers = 0;
    _start = false;
    {
        if (_x getVariable ["INF_Client_Ready",false]) then {
            _readyPlayers = _readyPlayers + 1;
        };
    } forEach _tmpPlayers;
    
    if (_readyPlayers >= INFS_Settings_MinPlayers) then {
        _start = true;
    };

    _start
};