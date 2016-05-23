root = parsingNamespace getVariable "MISSION_ROOT";
if (!hasInterface) exitWith {};

//player addAction ["Spawn Ammo",{createVehicle["Land_Ammobox_rounds_F", position player,[],0,"CAN_COLLIDE"];}];

{
    _x setVariable ["INF_showIcon", false, true];
    _x addEventhandler ["Fired",{
        (_this select 0) setVariable ["INF_playerFired",true,true];
        (_this select 0) setVariable ["INF_showIcon", true, true];
        (_this select 0) setVariable ["INF_iconOpacity", 1, true]}];
        
    _x setVariable ["INF_hitUnit", false, true];
    _x addEventhandler ["Hit",{
        (_this select 1) setVariable ["INF_hitUnit",true, true];
        (_this select 1) setVariable ["INF_showIcon", true, true];
        (_this select 1) setVariable ["INF_iconColor",[1,1,0],true];}];
        
    _x setVariable ["INF_playerDead",false,true];
    _x addEventhandler ["MPKilled",{
        (_this select 0) setVariable ["INF_playerDead",true,true];
        (_this select 0) setVariable ["INF_showIcon", true, true];
        (_this select 0) setVariable ["INF_iconOpacity", 1, true]}];
} forEach allUnits;

addMissionEventHandler ["Draw3D",{ { _x call INFD_fnc_handleIcons; } forEach allunits;}];

