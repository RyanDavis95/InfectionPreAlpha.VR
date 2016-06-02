params ["_client"];
private ["_currMag","_pWeapon","_sWeapon"];

if (_client getVariable ["INF_Client_Team","UNASSIGNED"] == "SURVIVOR") then {
    _currMag = currentMagazine _client;
    _pWeapon = primaryWeapon _client;

    _client addMagazines [_currMag, 2];  
};