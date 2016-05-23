params["_player"];
private["_team"];
_team = _player getVariable "INF_Team";

/* Setup EVH */
_player removeAllMPEventHandlers "MPRespawn";
_player removeAllMPEventHandlers "MPKilled";
_player removeAllEventHandlers "HandleDamage";
    
/* Respawn */
_player addMPEventHandler["MPRespawn",{
    _this call INF_fnc_initZombie; _this call INF_fnc_spawnPlayer}]; 

_player addEventhandler ["Hit",{
    (_this select 1) setVariable ["INF_hitUnit",true, true];
    (_this select 1) setVariable ["INF_iconColor",[1,1,0],true];
}];

_player addEventhandler ["Fired",{
    (_this select 0) setVariable ["INF_playerFired",true,true];
    (_this select 0) setVariable ["INF_iconOpacity", 1, true];
}];
 

if (_team == "SURVIVOR") then {
        /* Damage */
    _player addEventHandler["HandleDamage",
    {_this call INF_fnc_HandleSurvDamage}];
    
    /* killed */
    _player addMPEventHandler["MPKilled",{
        _this call INF_fnc_HandleKills;
        (_this select 0) setVariable ["INF_playerDead",true,true];
        (_this select 0) setVariable ["INF_iconOpacity", 1, true]
    }];
};
if (_team == "ZOMBIE") then {
        /* Damage */
    _player addEventHandler["HandleDamage",
    {_this call INF_fnc_HandleZomDamage}];
    
        /* Killed */  
    _player addMPEventHandler["MPKilled",{
        (_this select 0) removeAllEventHandlers "HandleDamage"; 
        _this call INF_fnc_removeGlow;
        _this call INF_fnc_HandleKills;
        (_this select 0) setVariable ["INF_playerDead",true,true];
        (_this select 0) setVariable ["INF_iconOpacity", 1, true]
    }];
};

/* Draw Player Icons */
addMissionEventHandler ["Draw3D",{ { _x call INFD_fnc_handleIcons; } forEach allunits;}];
  
