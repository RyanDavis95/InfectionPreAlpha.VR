params["_unit","_selectionName","_damage","_source","_projectile","_hitPart"];
private["_tmpDmg"];
_unit = _this param [0, objNull];
_selectionName = _this param [1, ""];
_damage = _this param [2, 0];
_source = _this param [3, objNull];
_projectile = _this param [4, ""];
_hitPart = _this param [5, 0];
_retValue = 0;

// Modifiers for different hit locations

if(side _source == Independent) then {
    _retValue = _damage;
};

_retValue