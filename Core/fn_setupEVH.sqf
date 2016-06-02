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
            [_corpse,"DEAD"] spawn INF_fnc_displayIcon;
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
          
        //_source call INFD_fnc_engagedIcon;
}];

_client addEventhandler ["Fired",{
        
        _client = _this select 0;
        [_client,"ENGAGED"] spawn INF_fnc_displayIcon;
}];
 
_client addEventHandler["HandleDamage",{
    _client = _this select 0;
    _dmg = _this select 2;
    _team = _client getVariable "INF_Client_Team";
    if (_team == "SURVIVOR") then {
        //_this call INF_fnc_handleSurvDamage;
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
        _kills = _killer getVariable ["INF_Client_Kills",0];
        _killer setVariable ["INF_Client_Kills",_kills+1,true];
    };
  
    _deaths = _victim getVariable ["INF_Client_Deaths",0];
    _victim setVariable ["INF_Client_Deaths",_deaths+1,true];

    _this spawn INF_fnc_updateStats;
    
    [_killer,"KILL"] spawn INF_fnc_displayIcon;
    _victim removeAllEventHandlers "HandleDamage"; 
}];

/* Draw Player Icons */
Everything = allDeadMen + allUnits;

addMissionEventHandler ["Draw3D",{
    INF_Settings_FrameCount = (INF_Settings_FrameCount + 1) % INF_Icons_RefreshRate;
    if (INF_Settings_FrameCount % INF_Icons_RefreshRate == 0) then {      
        { 
            _x spawn INF_fnc_drawIcon;
        } forEach Everything;
    };   
}];