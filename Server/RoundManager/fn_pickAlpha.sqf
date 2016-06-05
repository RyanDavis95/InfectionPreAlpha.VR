private ["_alpha","_found"];
INFS_Round_PickingZombie = true;
_alpha = objNull;
_found = false;

_time = serverTime;
_newZom = false;
waitUntil {
    sleep .1;
    [] call INFS_fnc_updateTeams;
    if !(INFS_Lists_Zombies isEqualTo []) then {
        _deadZom = false;
        {
            if (_x getVariable "INF_Client_Team" == "ZOMBIE") then {
                _deadZom = true;
            };
        } forEach INFS_Lists_DeadPlayers;
        _newZom = false;
        if (!_deadZom) then {
            _newZom = true;   
            (INFS_Lists_Zombies select 0) remoteExec ["INFD_fnc_playerInfected",INFS_Lists_Players,false];
        };
    };
(serverTime - _time > 10 || _newZom) 
};

if !(_newZom) then {
    while {!_found} do {
        _alpha = selectRandom INFS_Lists_Players;      
        if (alive _alpha && _alpha getVariable ["INF_Client_Ready",false]) then {
            _found = true;
        };
    };
    
    _alpha remoteExec ["INFD_fnc_playerInfected",INFS_Lists_Players,false];
    _alpha remoteExec ["INF_fnc_initZombie",_alpha,false]; 
};

[] call INFS_fnc_updateTeams;
INFS_Round_PickingZombie = false;