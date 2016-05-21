params ["_unit","_killer"];
private ["_team"];

_team = _unit getVariable "INF_Team";

if (_team == "SURVIVOR") then {
    _player setObjectTextureGlobal [0,'#(rgb,8,8,3)color(1,0,0,1)'];
};
if (_team == "ZOMBIE") then {
    _player setObjectTextureGlobal [0,'#(rgb,8,8,3)color(1,1,1,1)'];
};