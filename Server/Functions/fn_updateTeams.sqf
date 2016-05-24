INF_CurrentPlayers = [] call BIS_fnc_listPlayers;
INF_Survivors = [];
INF_Zombies = [];
<<<<<<< HEAD
INF_Unassigned = []; // Debug Var

{
    _team = _x getVariable "INF_Team";
=======

{

    _team = _x getVariable ["INF_Team","UNASSIGNED"];
>>>>>>> 8eb7024b30931cff101f53747d9e803a8aa4f7d7

    switch (_team) do {
        case "SURVIVOR": {INF_Survivors pushBack _x;};
        case "ZOMBIE": {INF_Zombies pushBack _x;};
<<<<<<< HEAD
        default { INF_Unassigned pushBack _x}; // Debug Purposes
=======
        default {};
>>>>>>> 8eb7024b30931cff101f53747d9e803a8aa4f7d7
    };
} forEach INF_CurrentPlayers;

missionNamespace setVariable ["INF_Survivors",INF_Survivors,true];
missionNamespace setVariable ["INF_Zombies",INF_Zombies,true];