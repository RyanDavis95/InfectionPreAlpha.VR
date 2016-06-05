params ["_client","_killer"];
private ["_team"];

_team = _client getVariable "INF_Client_Team";

if (_team == "SURVIVOR") then {
    _client call INFS_fnc_createGrave;
};

if (_team == "ZOMBIE") then {
    _client call INFS_fnc_dropItem;
};