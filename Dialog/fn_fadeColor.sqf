/*
    Smoothly changes one color to another color
    Param 1: Color to change to [r,g,b]
    Param 2: Color to change from [r,g,b]

    Return: slightly faded color (to be called repeatedly)
*/
params ["_colorTo","_colorFrom"];
private ["_changeR","_changeG","_changeB"];

_r = (_colorTo select 0) - (_colorFrom select 0);
_g = (_colorTo select 1) - (_colorFrom select 1);
_b = (_colorTo select 2) - (_colorFrom select 2);

_changeR = _colorFrom select 0;
_changeG = _colorFrom select 1;
_changeB = _colorFrom select 2;

if (_r > 0) then {
    _changeR = (_colorFrom select 0) + .01; 
} else {
    if (_r < 0) then {
        _changeR = (_colorFrom select 0) - .01; 
    };   
};

if (_g > 0) then {
    _changeG = (_colorFrom select 1) + .01;
} else {
    if (_g < 0) then {
        _changeG = (_colorFrom select 1) - .01;
    };   
};
    
if (_b > 0) then {
    _changeB = (_colorFrom select 2) + .01; 
} else {
    if (_b < 0) then {
        _changeB = (_colorFrom select 2) - .01; 
    };   
};

[_changeR,_changeG,_changeB]
