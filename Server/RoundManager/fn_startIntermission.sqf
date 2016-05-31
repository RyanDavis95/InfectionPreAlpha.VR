private ["_time"];

_time = serverTime + INFS_IntermissionTime;

/* Spawn Players */
[] call INFS_fnc_updateTeams;
{
    _x enableSimulationGlobal false;
    _x remoteExec ["INF_fnc_spawnPlayer",_x,false];
    _x remoteExec ["INF_fnc_initSurvivor",_x,false];
} forEach INFS_CurrentPlayers;


/* Display Screen Effects */
"Intermission1" cutRsc ["RscStatic","PLAIN"];
"Intermission2" cutRsc ["RscNoise","PLAIN"];

//"Starting new Round" remoteExec ["Hint",INFS_CurrentPlayers,false];

waitUntil { sleep 1; (serverTime >= _time)};

"Intermission1" cutRsc ["RscStatic","PLAIN"];
"Intermission2" cutText ["","PLAIN"];

{
    _x enableSimulationGlobal true;   
} forEach INFS_CurrentPlayers;