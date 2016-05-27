private ["_alpha","_found"];
INFS_PickingZom = true;
_alpha = objNull;
_found = false;

GUI_Message = "ZOMBIE";
publicVariable "GUI_Message";

_time = serverTime;
_newZom = false;
waitUntil {
    sleep .1;
    [] call INFS_fnc_updateTeams;
    if !(INFS_Zombies isEqualTo []) then {
        _newZom = true;       
        {
            (str _x + " has volunteered!") remoteExecCall ["hint",0,false];
        } forEach INFS_Zombies;
    };
(serverTime - _time > 10 || _newZom) 
};

if !(_newZom) then {
    while {!_found} do {
        _alpha = INFS_CurrentPlayers call BIS_fnc_SelectRandom;      
        if (alive _alpha && _alpha getVariable ["INF_ClientReady",false]) then {
            _found = true;
        };
    };
    
    format ["%1 is the Alpha Zombie!",name _alpha] remoteExec ["Hint",0,false];
    [_alpha,"ZOMBIE"] call INFS_fnc_setTeam;
    _alpha remoteExec ["INF_fnc_initZombie",_alpha,false]; 
};

[] call INFS_fnc_updateTeams;
INFS_PickingZom = false;



/*
{
    [_x,{       
        waitUntil { _this getVariable ["INF_ClientReady",false]}; 
        [] call INFD_fnc_zombieMessage;        
    }] remoteExec ["spawn",0,false];
} forEach INFS_CurrentPlayers; */