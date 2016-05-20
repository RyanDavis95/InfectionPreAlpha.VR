params ["_player"];
private ["_team"];

_team = _player getVariable "INF_Team";

if (_team == "SURVIVOR") then {
    _zone = missionNamespace getVariable "INF_Zone";
    _genPos = [getMarkerPos _zone, getMarkerSize _zone] call INF_fnc_genPos;
    _player setPos _genPos;
    //test
    //help
} else {
    
};