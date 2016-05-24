params ["_unit"];
private ["_team"];

_team = _unit getVariable "INF_Team";

if (_team == "SURVIVOR") then {
    _unit setHit ["chest", 0];
    _unit setHit ["hands", 0];
    _unit setHit ["body", 0];
    _unit setHit ["legs", 0];
    _unit setHit ["head", 0];    
};

if (_team == "ZOMBIE") then {
    _unit setHit ["chest", 0.8];
    _unit setHit ["hands", 0.8];
    _unit setHit ["body", 0.8];
    _unit setHit ["legs", 0.4];
    _unit setHit ["head", 0.8];   
};