params["_unit","_selectionName","_damage","_source","_projectile","_hitPart"];

if( _unit getVariable "INF_Client_Team" != _source getVariable "INF_Client_Team") then {
    
};

if (_source != objNull && _unit != _source) then {
    _unit setDammage 1;
};