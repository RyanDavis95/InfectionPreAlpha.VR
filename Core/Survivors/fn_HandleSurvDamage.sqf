params["_unit","_selectionName","_damage","_source","_projectile","_hitPart"];
private["_retValue"];
_unit = _this param [0, objNull];
_selectionName = _this param [1, ""];
_damage = _this param [2, 0];
_source = _this param [3, objNull];
_projectile = _this param [4, ""];
_hitPart = _this param [5, 0];
_retValue = _damage;

// Modifiers for different hit locations

if(_source getVariable "INF_Team" == "SURVIVOR") then {
    _retValue = 0;
};

_retValue