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
        [_victim,_source] call INFD_fnc_engagedIcon;
}];

_client addEventhandler ["Fired",{
        (_this select 0) call INFD_fnc_movingIcon;
}];
 
_client addEventHandler["HandleDamage",{
    if ((_this select 0) getVariable "INF_Team" == "SURVIVOR") then {
        _damage = _this call INF_fnc_handleSurvDamage;
    };
    if ((_this select 0) getVariable "INF_Team" == "ZOMBIE") then {
        _this call INF_fnc_handleZomDamage;
    };
    0
}];

_client addMPEventHandler["MPKilled",{          
     
        
    if ((_this select 0) getVariable "INF_Team" == "ZOMBIE") then {          
        _this call INF_fnc_removeGlow;
    };
    
    _this call INF_fnc_updateStats;
    //(_this select 1) call INFD_fnc_killIcon;
    //(_this select 0) removeAllEventHandlers "HandleDamage"; 
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