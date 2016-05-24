params ["_unit"];
private ["_mine","_mineCount"];

_mineCount = _unit getVariable "INF_PlayerMines";

if (_mineCount > 0) then {
    _mine = createMine["APERSBoundingMine", getPosATL _unit, [], 0];
    _unit setVariable ["INF_PlayerMines", _mineCount - 1 ];
} else {
    hint "Out of Mines!";
};

true