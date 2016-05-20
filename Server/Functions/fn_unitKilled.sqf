params ["_unit","_killer"];
private ["_team"];

_team = _unit getVariable "INF_Team";

if (_team == "SURVIVOR") then {
    _unit call INF_fnc_initZombie;
    hint "Survivor Was Killed!";
};