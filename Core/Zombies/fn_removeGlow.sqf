params ["_unit"];

private ["_light"];
_light = _unit getVariable "INF_ZombieLight";
deleteVehicle _light;