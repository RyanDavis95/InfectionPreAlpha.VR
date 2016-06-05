private ["_bodyCount","_spawncount"];
_bodyCount = 0;
_graveCount = 0;
_dropCount = 0;

{
    _bodyCount = _bodyCount + 1;
    deleteVehicle _x;  
} forEach allDead;

diag_log format ["CleanUp - %1 Bodies Removed",_bodyCount];

{
    _graveCount = _graveCount + 1;
    deleteVehicle _x;  
} forEach INFS_Lists_Graves;

diag_log format ["CleanUp - %1 Graves Removed",_graveCount];

{
    _dropCount = _dropCount + 1;
    deleteVehicle _x;  
} forEach INFS_Lists_Drops;

diag_log format ["CleanUp - %1 Drops Removed",_dropCount];