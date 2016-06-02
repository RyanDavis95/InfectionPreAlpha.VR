params ["_client","_stat"];

_val = _client getVariable [_stat,0];
_val = _val - 1;
_client setVariable [_stat,_val,true];