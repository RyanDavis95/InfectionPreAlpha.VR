private ["_bodyCount","_spawncount"];
_bodyCount = 0;
_spawnCount = 0;

{
    _bodyCount = _bodyCount + 1;
    deleteVehicle _x;  
} forEach allDead;

diag_log format ["CleanUp - %1 Bodies Removed",_bodyCount];

{
    _spawnCount = _spawnCount + 1;
    deleteVehicle _x;  
} forEach INF_SpawnedStructures;

diag_log format ["CleanUp - %1 Structures Removed",_spawnCount];