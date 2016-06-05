params ["_client"];
private ["_newVal","_currVal"];

{
    _newVal = _client getVariable _x;

    [[_client,_x,_newVal],{
        private ["_client","_stat","_newVal","_curVal"];
        _client = _this select 0;
        _stat = _this select 1;
        _newVal = _this select 2;
      
        _currVal = profileNamespace getVariable [_stat,0];
        profileNamespace setVariable [_stat, _newVal + _currVal];

    }] remoteExec ["BIS_fnc_call",_client,false];
       
    _client setVariable [_x,0];
    
} forEach INFS_Settings_ScoreVars;

{saveProfileNamespace;} remoteExec ["BIS_fnc_call",_client,false];