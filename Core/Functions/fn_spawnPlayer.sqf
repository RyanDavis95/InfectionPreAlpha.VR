params ["_player"];
private ["_team"];

_team = _player getVariable "INF_Team";

if (_team == "SURVIVOR") then {
    _zone = missionNamespace getVariable "INF_Zone";
    _genPos = [_player, getMarkerPos _zone, getMarkerSize _zone] call INF_fnc_zoneSpawn;
    _player setPos _genPos;

} else {
    
    _genPos = _player call INF_fnc_zombieSpawn;
    
    if (!isNil "_genPos") then {
        _player setPos _genPos;
    };  
};