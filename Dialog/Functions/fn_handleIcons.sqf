params ["_client", "_type"];
private ["_white","_red","_green","_blue","_purple","_black"];

_white = [1,1,1,1];
_red = [1,0,0,1];
_yellow = [1,1,0,1];
_green = [0,1,.25,1];
_blue = [0,1,1,1];
_purple = [1,0,1,1];
_black = [0,0,0,1];

if(_client getVariable ["INF_DisplayIcon",false]) then {

    switch (_type) do {
        
        case "DEAD": {          
            _color = [_client,_red,_red] call INFD_fnc_iconColor;
            [_client,_color] call INFD_fnc_drawIcon;
        };
        
        case "MOVING": {        
            _color = [_client,_blue,_blue] call INFD_fnc_iconColor;
            [_client,_color] call INFD_fnc_drawIcon;
        };
        
        case "KILLED": {
            _color = [_client,_blue,_green] call INFD_fnc_iconColor;
            [_client,_color] call INFD_fnc_drawIcon;
        };
        
        case "ENGAGED": {          
            _color = [_client,_blue,_yellow] call INFD_fnc_iconColor;
            [_client,_color] call INFD_fnc_drawIcon;
        };
        
        default { };
    };  
    
};