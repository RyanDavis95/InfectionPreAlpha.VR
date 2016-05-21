private ["_alpha"];

_alpha = INF_CurrentPlayers call BIS_fnc_SelectRandom;
{
    if (_x == _alpha) then {
        
        if (!alive _x) then {
            _x addMPEventHandler ["MPRespawn",{_this call INF_fnc_initZombie; _this call INF_fnc_spawnPlayer}];
        } else {
            _x remoteExec ["INF_fnc_initZombie",_x,false];
            [_x,"ZOMBIE"] call INFS_fnc_setTeam;
        };
               
    } else {
        if (!alive _x) then {
            _x addMPEventHandler ["MPRespawn",{_this call INF_fnc_initSurvivor; _this call INF_fnc_spawnPlayer}];
        } else {
            _x remoteExec ["INF_fnc_initSurvivor",_x,false];
            [_x,"SURVIVOR"] call INFS_fnc_setTeam;
        };
           
    };
   
} forEach INF_CurrentPlayers;

hint format ["%1\n%2",INF_Survivors,INF_Zombies];

[] call INFS_fnc_updateTeams;