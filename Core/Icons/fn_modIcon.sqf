params ["_client","_type"];
private ["_startTime","_displayTime"];

_color1 = [];
_color2 = [];
_modColor = false;
_team = _client getVariable "INF_Client_Team";

switch (_type) do {
    case "ENGAGED": {
        _modColor = true; 
        _color1 = [1,1,0,1]; 
        _color2 = [0,1,1,1];
        _client setVariable ["INF_Icons_Texture",INF_Settings_MissionRoot +"Resources\Images\triangle_CA.paa",true];
        };
    case "NORMAL": {
        
            if (_team == "SURVIVOR") then {
                _color1 = [0,1,1,1];
                _client setVariable ["INF_Icons_Texture",INF_Settings_MissionRoot +"Resources\Images\Icons\shield1_CA.paa",true];
            };          
            if (_team == "ZOMBIE") then {
                _color1 = [.2,1,.2,1];
                _client setVariable ["INF_Icons_Texture",INF_Settings_MissionRoot +"Resources\Images\Icons\infection_CA.paa",true];
            };
        
        };
    case "KILL": {
        _modColor = true; 
        _color1 = [0,1,0,1]; 
        _color2 = [0,1,1,1];
        _client setVariable ["INF_Icons_Texture",INF_Settings_MissionRoot +"Resources\Images\triangle_CA.paa",true];    
    };
    case "DEAD": { 
        _color1 = [1,0,0,1];
        _client setVariable ["INF_Icons_Texture","a3\ui_f_curator\data\cfgmarkers\kia_ca.paa",true];
        };
    default { };
};

_client setVariable ["INF_Icons_Color",_color1,true];

if (_modColor) then {
    terminate INF_Icons_FadeThread;
    
    INF_Icons_FadeThread = [_client,_color1,_color2,serverTime] spawn {
        
        waitUntil {
            _client = _this select 0;
            _color1 = _this select 1;
            _color2 = _this select 2;
            _startTime = _this select 3;
            
            /* Adjustment amount */
            _adj = (serverTime - _startTime) / INF_Icons_FadeTime;

            /* Difference */
            _r = (_color2 select 0) - (_color1 select 0);
            _g = (_color2 select 1) - (_color1 select 1);
            _b = (_color2 select 2) - (_color1 select 2); 

            /* Adjust Icon Color */
            _newR = (_r * _adj) + (_color1 select 0);
            _newG = (_g * _adj) + (_color1 select 1);
            _newB = (_b * _adj) + (_color1 select 2);

            /* Set Icon Color */
            _client setVariable ["INF_Icons_Color",[_newR,_newG,_newB,1],true];

            /* Exit if fade completed */
            (_adj >= 1)
        };
        
    };
};

