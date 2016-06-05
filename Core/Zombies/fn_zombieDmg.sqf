params["_client","_selectionName","_damage","_source","_projectile"];
private ["_dmg"];

_dmg = 0;
if( _client getVariable "INF_Client_Team" != 
    _source getVariable "INF_Client_Team") then {
    
    switch (_selectionName) do {
        case "head": {
            _curr = _client getVariable ["INF_Client_HeadDamage",0];         
            _dmg = (_damage * .1) + _curr;
            _client setVariable ["INF_Client_HeadDamage",_dmg,true];  
            
            if (_dmg >= 1 && isPlayer _source) then {
                [_source,"INF_Stats_Headshots"] call INF_fnc_incStat; 
            };
            
        };
        case "": {
            /* Overall Dmg before triggered - Dont Modify */
        };
        default { 
            _curr = _client getVariable ["INF_Client_OtherDamage",0];
            _dmg = (_damage * .01) + _curr;
            _client setVariable ["INF_Client_OtherDamage",_dmg,true];
        };
    };
};

_client call INF_fnc_bloodEffects;
_client setDammage _dmg;

0