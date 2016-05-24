params ["_unit"];
private ["_unit","_tmpStamina"];


_tmpStamina = getStamina _unit;
_unit setAnimSpeedCoef 1.15;
_unit enableStamina false;

sleep 10;

_unit enableStamina true;
_unit setAnimSpeedCoef 1;
_unit setStamina (_tmpStamina - 10);

true