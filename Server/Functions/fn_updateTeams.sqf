INFS_CurrentPlayers = playableUnits + allDeadMen;//[] call BIS_fnc_listPlayers;

INFS_Survivors = [];
INFS_Zombies = [];
INFS_Unassigned = []; // Debug Var

{
    _team = _x getVariable ["INF_Team","UNASSIGNED"];

    switch (_team) do {
        case "SURVIVOR": {INFS_Survivors pushBack _x;};
        case "ZOMBIE": {INFS_Zombies pushBack _x;};
        default { INFS_Unassigned pushBack _x}; // Debug Purposes
    };       
} forEach INFS_CurrentPlayers;

_started = missionNamespace getVariable ["INF_GameInProgress",false];
{
    if (_started) then {
        _x remoteExec ["INF_fnc_initZombie",_x,false];
    } else {
        _x remoteExec ["INF_fnc_initSurvivor",_x,false];
    };
} forEach INFS_Unassigned;

missionNamespace setVariable ["INF_Survivors",INFS_Survivors,true];
missionNamespace setVariable ["INF_Zombies",INFS_Zombies,true];