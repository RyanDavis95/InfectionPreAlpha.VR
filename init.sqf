root = parsingNamespace getVariable "MISSION_ROOT";
if (!hasInterface) exitWith {};

//player addAction ["Spawn Ammo",{createVehicle["Land_Ammobox_rounds_F", position player,[],0,"CAN_COLLIDE"];}];

{
    _x setVariable ["INF_showIcon", false, true];
    _x addEventhandler ["Fired",{
        (_this select 0) setVariable ["INF_showIcon", true, true];
        (_this select 0) setVariable ["INF_iconOpacity", 1, true]}];
    _x setVariable ["INF_hitUnit", false, true];
    _x addEventhandler ["Hit",{
        (_this select 1) setVariable ["INF_hitUnit",true, true];
        (_this select 1) setVariable ["INF_iconColor",[1,1,0],true];
        color = [1,1,0];//_client getVariable ["INF_iconColor",_baseColor];
    }];
} forEach allUnits;

_handle1 = addMissionEventHandler ["Draw3D",{
    {
        if (_x getVariable "INF_showIcon") then {
            _x call INFD_fnc_drawIcon;
        };                   
    } forEach allunits;  
}];

