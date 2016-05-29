params["_client"];

/* Setup EVH */
_client removeAllMPEventHandlers "MPHit";
_client removeAllMPEventHandlers "MPRespawn";
_client removeAllMPEventHandlers "MPKilled";
_client removeAllEventHandlers "Fired";
_client removeAllEventHandlers "HandleDamage";
  
/* Respawn */
_client addMPEventHandler["MPRespawn",{
    _client = _this select 0;
    _corpse = _this select 1;
    _client setVariable ["INF_ItemDropped",false];
    _client setVariable ["INF_AssistSources",[],true];
    
    if !(missionNamespace getVariable "INF_GameInProgress") then {
        _client call INF_fnc_initSurvivor;
        _client call INF_fnc_spawnPlayer;
    } else {
        
        if (_client getVariable "INF_Team" == "SURVIVOR") then {
            [_corpse, _client] call INFD_fnc_deadIcon;
        };
        
        if (_client getVariable "INF_Team" == "ZOMBIE") then {
            _client call INF_fnc_spawnPlayer; 
        };
         
        _client call INF_fnc_initZombie;
    };
        
}]; 

_client addMPEventhandler ["MPHit",{
        _victim = _this select 0;
        _source = _this select 1;

        _allAssists = _victim getVariable ["INF_Stat_ListAssists",[]];

        if !(_source in _allAssists) then {
            _allAssists = _allAssists + [_source];
            _victim setVariable ["INF_Stat_ListAssists", _allAssists, true];                         
        };
          
        _source call INFD_fnc_engagedIcon;
}];

_client addEventhandler ["Fired",{
        
        _client = _this select 0;
        _clientTeam = _client getVariable "INF_Team";
        _nearPlayers = (_this select 0) nearEntities ["Man", 10];
        _enemyClose = false;
        
        {
            if (_x getVariable "INF_Team" != _clientTeam) then {
                _enemyClose = true;
            };
        } forEach _nearPlayers;
        
        if (_enemyClose) then {
           _client call INFD_fnc_engagedIcon;
        } else {
           _client call INFD_fnc_movingIcon;
        };
}];
 
_client addEventHandler["HandleDamage",{
    _dmg = _this select 2;
    if ((_this select 0) getVariable "INF_Team" == "SURVIVOR") then {
        //_this call INF_fnc_handleSurvDamage;
    };
    if ((_this select 0) getVariable "INF_Team" == "ZOMBIE") then {
        _dmg = _this call INF_fnc_zombieDmg;
    };
    _dmg
}];

_client addMPEventHandler["MPKilled",{
    _victim = _this select 0;
    _killer = _this select 1;    
    
    _kills = _killer getVariable ["INF_Stat_Kills",0];
    _killer setVariable ["INF_Stat_Kills",_kills+1,true];
    
    _deaths = _victim getVariable ["INF_Stat_Deaths",0];
    _victim setVariable ["INF_Stat_Deaths",_deaths+1,true];


    _this spawn INF_fnc_updateStats;
    
    //(_this select 1) call INFD_fnc_killIcon;
    _victim removeAllEventHandlers "HandleDamage"; 
}];

/* Draw Player Icons */
Everything = allDeadMen + allUnits;

addMissionEventHandler ["Draw3D",{
    INF_FrameCount = (INF_FrameCount + 1) % INF_IconRefreshRate;
    if (INF_FrameCount % INF_IconRefreshRate == 0) then {      
        { 
            _type = _x getVariable ["INF_IconType",""];
            [_x,_type] call INFD_fnc_handleIcons; 
        } forEach Everything;
    };   
}];