params ["_player"];

_zone = missionNamespace getVariable "INF_Zone";
_genPos = [_player, getMarkerPos _zone, getMarkerSize _zone] call INF_fnc_zoneSpawn;
_player setPos _genPos;