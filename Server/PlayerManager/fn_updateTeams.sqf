_readyPlayers = [];
_tmpSurvivors = [];
_tmpZombies = [];

_tmpPlayers = playableUnits;//[] call BIS_fnc_listPlayers;
{
    if (_x getVariable ["INF_ClientReady",false]) then {
        _readyPlayers pushBack _x;
    };
} forEach _tmpPlayers;

INFS_CurrentPlayers = _readyPlayers;
INFS_Unassigned = []; // Debug Var

{
    _team = _x getVariable ["INF_Client_Team","UNASSIGNED"];

    switch (_team) do {
        case "SURVIVOR": {_tmpSurvivors pushBack _x;};
        case "ZOMBIE": {_tmpZombies pushBack _x;};
        default { INFS_Unassigned pushBack _x}; // Debug Purposes
    };       
} forEach INFS_CurrentPlayers;

INFS_Survivors = _tmpSurvivors;
INFS_Zombies = _tmpZombies;
INFS_DeadPlayers = allDeadMen;