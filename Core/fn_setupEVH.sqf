params["_client"];
private["_team"];
_team = _client getVariable "INF_Team";

/* Setup EVH */
_client removeAllMPEventHandlers "MPRespawn";
_client removeAllMPEventHandlers "MPKilled";
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

_client addEventhandler ["Hit",{
    (_this select 1) setVariable ["INF_hitUnit",true, true];
    (_this select 1) setVariable ["INF_iconColor",[1,1,0],true];
}];

_client addEventhandler ["Fired",{
    (_this select 0) setVariable ["INF_playerFired",true,true];
    (_this select 0) setVariable ["INF_iconOpacity", 1, true];
}];
 

if (_team == "SURVIVOR") then {
        /* Damage */
    _client addEventHandler["HandleDamage",
    {_this call INF_fnc_HandleSurvDamage}];
    
    /* killed */
    _client addMPEventHandler["MPKilled",{
        _this call INF_fnc_updateStats;
        (_this select 0) setVariable ["INF_playerDead",true,true];
        (_this select 0) setVariable ["INF_iconOpacity", 1, true];
    }];
};
if (_team == "ZOMBIE") then {
        /* Damage */
    _client addEventHandler["HandleDamage",
    {_this call INF_fnc_HandleZomDamage}];
    
        /* Killed */  
    _client addMPEventHandler["MPKilled",{
        (_this select 0) removeAllEventHandlers "HandleDamage"; 
        _this call INF_fnc_removeGlow;
        _this call INF_fnc_updateStats;
        (_this select 0) setVariable ["INF_playerDead",true,true];
        (_this select 0) setVariable ["INF_iconOpacity", 1, true];
        
    }];
};

/* Draw Player Icons */
Everything = allDeadMen + allUnits;

addMissionEventHandler ["Draw3D",{
    _update = 5;
    INF_FrameCount = (INF_FrameCount + 1) % _update;
    if (INF_FrameCount % _update == 0) then {
        { _x call INFD_fnc_handleIcons; } forEach Everything;
    };   
}];
  
