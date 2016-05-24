params ["_client"];

_zone = missionNamespace getVariable "INF_Zone";
_genPos = [_client, getMarkerPos _zone, getMarkerSize _zone] call INF_fnc_zoneSpawn;
_client setPos _genPos;