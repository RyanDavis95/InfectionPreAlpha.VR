params["_client"];

/* Setup EVH */
_client removeAllMPEventHandlers "MPHit";
_client removeAllMPEventHandlers "MPRespawn";
_client removeAllMPEventHandlers "MPKilled";
_client removeAllEventHandlers "Fired";
_client removeAllEventHandlers "HandleDamage";
  
/* Respawn */
_client addMPEventHandler["MPRespawn",{
    if !(missionNamespace getVariable "INF_GameInProgress") then {
        (_this select 0) call INF_fnc_initSurvivor;
        (_this select 0) call INF_fnc_spawnPlayer;
    } else {
        if ((_this select 0) getVariable "INF_Team" == "ZOMBIE") then {
            (_this select 0) call INF_fnc_spawnPlayer; 
        };
        (_this select 0) call INF_fnc_initZombie;
    };      
}]; 

_client addMPEventhandler ["MPHit",{
        (_this select 1) call INFD_fnc_engagedIcon;
}];

_client addEventhandler ["Fired",{
        (_this select 0) call INFD_fnc_movingIcon;
}];
 
_client addEventHandler["HandleDamage",{
    if (_client getVariable "INF_Team" == "SURVIVOR") then {
        _this call INF_fnc_HandleSurvDamage;
    };
    if (_client getVariable "INF_Team" == "ZOMBIE") then {
        _this call INF_fnc_HandleZomDamage;  
    };
}];

_client addMPEventHandler["MPKilled",{          
    (_this select 0) removeAllEventHandlers "HandleDamage";  
        
    if ((_this select 0) getVariable "INF_Team" == "ZOMBIE") then {          
        _this call INF_fnc_removeGlow;
    };
    
    _this call INF_fnc_updateStats;
    (_this select 0) call INFD_fnc_deadIcon;
    (_this select 1) call INFD_fnc_killIcon;
}];

/* Draw Player Icons */
Everything = allDeadMen + allUnits;

addMissionEventHandler ["Draw3D",{
    _update = 5;
    INF_FrameCount = (INF_FrameCount + 1) % _update;
    if (INF_FrameCount % _update == 0) then {      
        { 
            _type = _x getVariable ["INF_IconType",""];
            [_x,_type] call INFD_fnc_handleIcons; 
        } forEach Everything;
    };   
}];