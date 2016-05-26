params["_unit","_selectionName","_damage","_source","_projectile","_hitPart"];

if( _unit getVariable "INF_Team" != _source getVariable "INF_Team") then {
    //_unit setDammage ((getDammage _unit) + _damage);
};

0