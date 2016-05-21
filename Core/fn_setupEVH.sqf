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

if (_team == "SURVIVOR") then {
        /* Damage */
    _player addEventHandler["HandleDamage",
    {_this call INF_fnc_HandleSurvDamage}];
    
    _player addMPEventHandler["MPKilled",{
        _this call INF_fnc_HandleKills;       
    }];
};
if (_team == "ZOMBIE") then {
        /* Damage */
    _player addEventHandler["HandleDamage",
    {_this call INF_fnc_HandleZomDamage}];
    
        /* Killed */
    _player addMPEventHandler["MPKilled",
    {
        (_this select 0) removeAllEventHandlers "HandleDamage"; 
        _this call INF_fnc_removeGlow;
        
    }];
};