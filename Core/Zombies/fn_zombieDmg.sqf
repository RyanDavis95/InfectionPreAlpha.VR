params["_client","_selectionName","_damage","_source","_projectile"];
private ["_dmg"];

_dmg = 0;
if( _client getVariable "INF_Team" != 
    _source getVariable "INF_Team") then {
    
    
    switch (_selectionName) do {
        case "head": {
            _curr = _client getVariable ["INF_HeadDmg",0];
            _dmg = (_damage * .01) + _curr;
            if (_dmg >= 1 && _source != objNull) then {
                _hs = _source getVariable ["INF_HeadshotStat",0];
                _source setVariable ["INF_HeadshotStat"_hs+1,true];
            };
        };
        case "neck": { 
            _curr = _client getVariable ["INF_HeadDmg",0];
            _dmg = (_damage * .01) + _curr;
            if (_dmg >= 1) then {
                _hs = _source getVariable ["INF_HeadshotStat",0];
                _source setVariable ["INF_HeadshotStat"_hs+1,true];
            };
        };
        case "": {
            //Overall Dmg before triggered - Dont Modify
        }
        default { 
            _curr = _client getVariable ["INF_OtherDmg",0];
            _dmg = (_damage * .01) + _curr;           
        };
    };
};

_client call INF_fnc_bloodEffects;
_dmg