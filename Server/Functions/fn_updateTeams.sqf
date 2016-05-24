INF_CurrentPlayers = [] call BIS_fnc_listPlayers;
INF_Survivors = [];
INF_Zombies = [];
INF_Unassigned = []; // Debug Var


{

    _team = _x getVariable ["INF_Team","UNASSIGNED"];

    switch (_team) do {
        case "SURVIVOR": {INF_Survivors pushBack _x;};
        case "ZOMBIE": {INF_Zombies pushBack _x;};
        default { INF_Unassigned pushBack _x}; // Debug Purposes
    };
} forEach INF_CurrentPlayers;

missionNamespace setVariable ["INF_Survivors",INF_Survivors,true];
missionNamespace setVariable ["INF_Zombies",INF_Zombies,true];