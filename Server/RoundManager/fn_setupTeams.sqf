private ["_alpha"];

waitUntil { sleep 1; player globalChat "Waiting for more players..";
        INF_CurrentPlayers = [] call BIS_fnc_listPlayers;
        count INF_CurrentPlayers > 1 
    };
    
player globalChat "Starting Match";

_alpha = INF_CurrentPlayers call BIS_fnc_SelectRandom;

{
    if (_x == _alpha) then {
        
        if (!alive _x) then {
            _x addMPEventHandler ["MPRespawn",{_this call INF_fnc_initZombie; _this call INF_fnc_spawnPlayer}];
        } else {
            _x call INF_fnc_initZombie;
        };
               
    } else {
        if (!alive _x) then {
            _x addMPEventHandler ["MPRespawn",{_this call INF_fnc_initSurvivor; _this call INF_fnc_spawnPlayer}];
        } else {
            _x call INF_fnc_initSurvivor; 
        };
           
    };
   
} forEach INF_CurrentPlayers;

[] call INFS_fnc_updateTeams;