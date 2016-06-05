params ["_client"];

_created = _client getVariable ["INF_Client_GraveSpawned",false];

if (!_created) then {
    _client setVariable ["INF_Client_GraveSpawned",true,true];
    _grave = createVehicle ["Land_Grave_dirt_F",
        (getPos _client),
        [],
        0,
        "CAN_COLLIDE"
    ];

    _grave setDir (getDir _client);
    _grave setVariable ["INF_Icons_Text",name _client,true];
    [_grave,"DEAD"] spawn INF_fnc_modIcon;
    INFS_Lists_Graves pushBack _grave;
};
