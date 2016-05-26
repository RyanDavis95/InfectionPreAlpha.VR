/*
    Smoothly changes one color to another color
    Param 1: Color to change to [r,g,b]
    Param 2: Color to change from [r,g,b]

    Return: slightly faded color (to be called repeatedly)
*/
params ["_colorTo","_colorFrom"];
private ["_changeR","_changeG","_changeB"];

_fadeTime = 10;
_time = _client getVariable "INF_IconTime";

_adj = (serverTime - _time) / _fadeTime;
_opacity = .85;

_rDiff = (_colorTo select 0) - (_colorFrom select 0);
_gDiff = (_colorTo select 1) - (_colorFrom select 1);
_bDiff = (_colorTo select 2) - (_colorFrom select 2);

_newR = (_rDiff * _adj) + (_colorFrom select 0);
_newG = (_gDiff * _adj) + (_colorFrom select 1);
_newB = (_bDiff * _adj) + (_colorFrom select 2);

if (_adj >= .75) then {
    _opacity = (1 - _adj) / .25;
};

if (_adj >= 1) then {
    _client setVariable ["INF_DisplayIcon",false,true];
};

[_newR,_newG,_newB,_opacity]