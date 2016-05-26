params ["_unit"];
private ["_team"];

switch (_unit getVariable ["INF_Team","UNASSIGNED"]) do {
    case "SURVIVOR": {
        _unit setHit ["chest", 0];
        _unit setHit ["hands", 0];
        _unit setHit ["body", 0];
        _unit setHit ["legs", 0];
        _unit setHit ["head", 0]; 
    };
    case "ZOMBIE": {
        _unit setHit ["chest", 0.8];
        _unit setHit ["hands", 0.8];
        _unit setHit ["body", 0.8];
        _unit setHit ["legs", 0.4];
        _unit setHit ["head", 0.8]; 
    };
    default { };
};