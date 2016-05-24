params["_client"];
private["_team"];
_team = _client getVariable "INF_Team";

/* Setup EVH */
_client removeAllMPEventHandlers "MPRespawn";
_client removeAllMPEventHandlers "MPKilled";
_client removeAllEventHandlers "HandleDamage";
    
/* Respawn */
_client addMPEventHandler["MPRespawn",{
    _this call INF_fnc_initZombie; _this call INF_fnc_spawnPlayer}]; 

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
        _this call INF_fnc_HandleKills;
        (_this select 0) setVariable ["INF_playerDead",true,true];
        (_this select 0) setVariable ["INF_iconOpacity", 1, true]
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
        _this call INF_fnc_HandleKills;
        (_this select 0) setVariable ["INF_playerDead",true,true];
        (_this select 0) setVariable ["INF_iconOpacity", 1, true]
    }];
};

/* Draw Player Icons */
addMissionEventHandler ["Draw3D",{ { _x call INFD_fnc_handleIcons; } forEach allunits;}];
  
