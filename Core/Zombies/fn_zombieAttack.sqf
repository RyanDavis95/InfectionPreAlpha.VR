private ["_unit","_Bluefor"];
_unit = _this param [0,objNull];

{_unit reveal _x} forEach PlayableUnits;
if (!INF_zombieAttacking) then {
    INF_zombieAttacking = true;
_unit switchMove "AwopPercMstpSgthWnonDnon_throw";// OLD THROW "AwopPercMstpSgthWnonDnon_throw";
waitUntil { animationState _unit != "AwopPercMstpSgthWnonDnon_throw"; };

if (side cursorTarget != Independent && _unit distance cursorTarget < 2) then {
    cursorTarget setDamage ((getDammage cursorTarget) + .33);
};
_unit playMove "";
sleep .25;
INF_zombieAttacking = false;
};