params ["_unit","_killer"];
private ["_team"];

_team = _unit getVariable "INF_Team";

if (_team == "SURVIVOR") then {
    _grave = createVehicle ["Land_Grave_dirt_F",
        (getPos _unit),
        [],
        0,
        "CAN_COLLIDE"
    ];
    
    _grave setDir (getDir _unit);
    INF_SpawnedStructures pushBack _grave;
};

if (_team == "ZOMBIE") then {
    _unit call INFS_fnc_dropItem;
};