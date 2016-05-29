params["_client","_selectionName","_damage","_source","_projectile"];
private ["_dmg"];

_dmg = 0;
if( _client getVariable "INF_Team" != 
    _source getVariable "INF_Team") then {
    
    switch (_selectionName) do {
        case "head": {
            _curr = _client getVariable ["INF_HeadDmg",0];
            _dmg = (_damage * .1) + _curr;
            if (_dmg >= 1 && _source != objNull) then {
                [_client,"INF_Stat_Headshots"] call INF_fnc_incStat; 
            };
            _client setVariable ["INF_HeadDmg",_dmg,true];  
        };
        case "": {
            /* Overall Dmg before triggered - Dont Modify */
        };
        default { 
            _curr = _client getVariable ["INF_OtherDmg",0];
            _dmg = (_damage * .01) + _curr;
            _client setVariable ["INF_OtherDmg",_dmg,true];
        };
    };
};

_client call INF_fnc_bloodEffects;
_client setDammage _dmg;

0