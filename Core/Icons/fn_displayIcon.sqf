params ["_client","_type"];
private ["_startTime","_displayTime"];

_startTime = serverTime;
INF_Icons_Updates pushBack _startTime;
_fadeTime = 5;
_color1 = [];
_color2 = [];
_modColor = false;
switch (_type) do {
    case "ENGAGED": {
        _modColor = true; 
        _color1 = [1,1,0,1]; 
        _color2 = [0,1,1,1];
        _client setVariable ["INF_Icons_Texture",INF_Settings_MissionRoot + "",true];
        };
    case "NORMAL": { 
        _color1 = [0,1,1,1];
        _client setVariable ["INF_Icons_Texture",INF_Settings_MissionRoot + "",true];
        };
    case "KILL": {
        _modColor = true; 
        _color1 = [0,1,0,1]; 
        _color2 = [0,1,1,1];
        _client setVariable ["INF_Icons_Texture",INF_Settings_MissionRoot + "",true];    
    };
    case "DEAD": { 
        _color1 = [1,0,0,1];
        _client setVariable ["INF_Icons_Texture",INF_Settings_MissionRoot + "",true];
        };
    default { };
};

_client setVariable ["INF_Icons_Color",_color1,true];

while {_modColor && !(count INF_Icons_Updates > 1)} do {
    
    /* Adjustment amount */
    _adj = (serverTime - _startTime)/_fadeTime;
    
    /* Difference */
    _currColor = _client getVariable "INF_Icons_Color";
    _r = (_currColor select 0) - (_color2 select 0);
    _g = (_currColor select 1) - (_color2 select 1);
    _b = (_currColor select 2) - (_color2 select 2); 
    
    /* Adjust Icon Color */
    _newR = (_r * _mod) + _currColor select 0;
    _newG = (_g * _mod) + _currColor select 1;
    _newB = (_b * _mod) + _currColor select 2;
    
    /* Set Icon Color */
    _client setVariable ["INF_Icons_Color",[_newR,_newG,_newB,1,true];
    
    if (_adj >= 1) then {
        _modColor = false;
    };
};

INF_Icons_Updates = INF_Icons_Updates - [_startTime];