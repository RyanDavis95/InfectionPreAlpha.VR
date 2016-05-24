params ["_client","_stat","_value"];

_oldVal = _client getVariable [_stat,0];
_client setVariable [_stat,_value + _oldVal,true];