params ["_unit","_killer"];
private ["_team"];

_team = _unit getVariable "INF_Team";

if (_team == "SURVIVOR") then {
    _grave = "Land_Grave_dirt_F" createVehicle (getPos _unit);
    _grave setDir (getDir _unit);
    INF_SpawnedStructures pushBack _grave;
};
