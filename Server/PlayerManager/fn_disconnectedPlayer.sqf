params ["_unit","_id","_uid","_name"];

waitUntil {sleep .1; !isPlayer _unit};
_unit setDammage 1;

_unit enableSimulationGlobal false;