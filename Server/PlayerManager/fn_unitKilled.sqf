params ["_client","_killer"];
private ["_team"];

_team = _client getVariable "INF_Client_Team";

if (_team == "SURVIVOR") then {
    _grave = createVehicle ["Land_Grave_dirt_F",
        (getPos _client),
        [],
        0,
        "CAN_COLLIDE"
    ];
    
    _grave setDir (getDir _client);
    _grave setVariable ["INF_Icons_Text",name _client,true];
    [_grave,"DEAD"] spawn INF_fnc_modIcon;
    INFS_SpawnedStructures pushBack _grave;
};

if (_team == "ZOMBIE") then {
    _client call INFS_fnc_dropItem;
};