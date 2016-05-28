params ["_unit"];

private ["_light"];
_light = _unit getVariable "INF_ZombieLight";
hint str _light;
//deleteVehicle _light;