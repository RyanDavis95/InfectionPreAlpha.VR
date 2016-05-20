params ["_unit"];
private ["_dmg","_healCount"];
_healCount = _unit getVariable "INF_PlayerHeals";
_dmg = getDammage _unit;

if (_healCount > 0) then {
    _unit playMove "AinvPknlMstpSnonWnonDnon_medic_1";
    sleep 6;
    _unit setDammage 0;
    _unit setVariable ["INF_PlayerHeals", _healCount - 1, false];
} else {
    hint "Out of Heals!";
};

true