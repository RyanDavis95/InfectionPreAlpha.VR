params["_client"];


{_client removeAllEventHandlers _x;} forEach ["Fired","HandleDamage"];
{_client removeAllMPEventHandlers _x;} forEach ["MPHit","MPRespawn","MPKilled"];
  
/* Respawn */
_client addMPEventHandler["MPRespawn",{
    _client = _this select 0;
    _corpse = _this select 1;
    _team = _client getVariable "INF_Client_Team";
    _client setVariable ["INF_Client_ItemDropped",false,true];
    _client setVariable ["INF_Client_Attackers",[],true];
    
    if !(missionNamespace getVariable "INF_GameInProgress") then {
        _client call INF_fnc_initSurvivor;
        _client call INF_fnc_spawnPlayer;
    } else {
        
        if ( _team == "SURVIVOR") then {           
            
        };
        
        if (_team == "ZOMBIE") then {
            _client call INF_fnc_spawnPlayer;
        };
         
        _client call INF_fnc_initZombie;
    };
        
}]; 

_client addMPEventhandler ["MPHit",{
        _victim = _this select 0;
        _source = _this select 1;

        _allAssists = _victim getVariable ["INF_Client_Attackers",[]];

        if !(_source in _allAssists && _victim != _source) then {
            _allAssists = _allAssists + [_source];
            _victim setVariable ["INF_Client_Attackers", _allAssists, true];                         
        };
}];

_client addEventhandler ["Fired",{
        _client = _this select 0;
        [_client,"ENGAGED"] spawn INF_fnc_modIcon;
}];
 
_client addEventHandler["HandleDamage",{
    _client = _this select 0;
    _dmg = _this select 2;
    _team = _client getVariable "INF_Client_Team";
    if (_team == "SURVIVOR") then {
        _this call INF_fnc_handleSurvDamage;
    };
    if (_team == "ZOMBIE") then {
        _dmg = _this call INF_fnc_zombieDmg;
    };
0
}];

_client addMPEventHandler["MPKilled",{
    _victim = _this select 0;
    _killer = _this select 1;    
    
    if (_killer != _victim) then {
        [_killer, "INF_Stats_Kills"] call INF_fnc_incStat;
        [_killer,"KILL"] spawn INF_fnc_modIcon;
        _this spawn INF_fnc_updateStats;
    }; 
    
    [_victim, "INF_Stats_Deaths"] call INF_fnc_incStat;
       
    _victim removeAllEventHandlers "HandleDamage"; 
}];