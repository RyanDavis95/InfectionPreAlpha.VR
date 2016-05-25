INFS_CurrentPlayers = playableUnits;//[] call BIS_fnc_listPlayers;

INFS_Survivors = [];
INFS_Zombies = [];
INFS_Unassigned = []; // Debug Var


{
    if (alive _x) then {
        
        _team = _x getVariable ["INF_Team","UNASSIGNED"];

        switch (_team) do {
            case "SURVIVOR": {INFS_Survivors pushBack _x;};
            case "ZOMBIE": {INFS_Zombies pushBack _x;};
            default { INFS_Unassigned pushBack _x}; // Debug Purposes
        };       
    };
} forEach INFS_CurrentPlayers;

missionNamespace setVariable ["INF_Survivors",INFS_Survivors,true];
missionNamespace setVariable ["INF_Zombies",INFS_Zombies,true];