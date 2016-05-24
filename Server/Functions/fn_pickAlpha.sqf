private ["_alpha","_found"];
INF_PickingZom = true;
_alpha = objNull;
_found = false;

format ["Picking new Zombie"] remoteExec ["Hint",0,false];
sleep 10;

while {!_found} do {
    _alpha = INF_CurrentPlayers call BIS_fnc_SelectRandom;
    if (alive _alpha && _alpha getVariable ["INF_ClientReady",false]) then {
        _found = true;
    };
};

format ["%1 is the Alpha Zombie!",name _alpha] remoteExec ["Hint",0,false];
[_alpha,"ZOMBIE"] call INFS_fnc_setTeam;
_alpha remoteExec ["INF_fnc_initZombie",_alpha,false];
INF_PickingZom = false;  
