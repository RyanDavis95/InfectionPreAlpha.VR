params ["_client"];

INF_initJIP = true;

[_client,"ZOMBIE"] call INFS_fnc_setTeam;
_client remoteExec ["INF_fnc_initZombie",_client,false];
_client remoteExec ["INF_fnc_spawnPlayer",_client,false];

INF_initJIP = false;