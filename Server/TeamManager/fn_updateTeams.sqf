params ["_player"];

INF_CurrentPlayers = [] call BIS_fnc_listPlayers;
INF_Survivors = [];
INF_Zombies = [];


{
    _team = _x getVariable "INF_Team";

    switch (_team) do {
        case "SURVIVOR": {INF_Survivors pushBack _x};
        case "ZOMBIE": {INF_Zombies pushBack _x};
        default { hint "No Team Specified"};
    };
     
} forEach INF_CurrentPlayers;