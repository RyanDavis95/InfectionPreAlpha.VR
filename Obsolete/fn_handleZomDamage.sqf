params["_client","_selectionName","_damage","_source","_projectile","_hitPart"];
private ["_hitName","_val","_mod"];

if( _client getVariable "INF_Team" != _source getVariable "INF_Team") then {

    _hitName = "";
    _mod = 0;
    switch (_selectionName) do {
        case "neck": {
            _hitName = "hitNeck"; 
            _mod = .01;
        };
        case "head": {
            _hitName = "hitHead"; 
            _mod = .03;
        };
        case "pelvis": {
            _hitName = "hitPelvis"; 
            _mod = .01;
        };
        case "spine1": {
            _hitName = "hitAbdomen"; 
            _mod = .01;
        };
        case "spine2": {
            _hitName = "hitDiaphragm"; 
            _mod = .01;
        };
        case "spine3": {
            _hitName = "hitChest"; 
            _mod = .01;
        };
        case "body": {
            _hitName = "hitBody"; 
            _mod = .01;
        };
        case "hands": {
            _hitName = "hitHands"; 
            _mod = .01;
        };
        case "legs": {
            _hitName = "hitLegs"; 
            _mod = .01;
        };
        default {
            _hitName = ["hitFace","hitArms"] call BIS_fnc_SelectRandom; 
            _mod = .01;
        };
    };

    _val = (_client getVariable ["INF_UnitDmg",0]) + (_damage * _mod);
    _client setVariable ["INF_UnitDmg", _val, true];
    _client setDammage _val;
    _client call INF_fnc_bloodEffects;

    if (_val >= 1) then {
        _client setVariable ["INF_UnitDmg", 0, true];
    };
};