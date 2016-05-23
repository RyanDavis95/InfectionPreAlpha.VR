params ["_client"];

_bbr = boundingBoxReal vehicle _client;
_p1 = _bbr select 0;
_p2 = _bbr select 1;
_maxHeight = abs ((_p2 select 2) - (_p1 select 2));

_baseColor = [0,1,1];//Put in Master config..
_opacity = _client getVariable ["INF_iconOpacity",1];
_color = color;
hint str _color;
if (_color select 0 == 1 && _color select 1 == 0 && _color select 2 == 0) then {
    hint "FUcked";
};

if (player distance _client < 100 && _client != player) then {
  
    drawIcon3D [
        root + "resources\Images\testTriangle_CA.paa", //Texture
        [_color select 0, _color select 1, _color select 2, _opacity], //Color
        [(getPosATL _client) select 0, (getPosATL _client) select 1, ((getPosATL _client) select 2) + _maxHeight + .25], //DrawPosition
        .5, //Texture width
        .5, //Texture Height
        0, //Texture Angle
        name _client, //Icon Text
        2, // Nothing = 0, Shadow = 1, Outline = 2
        0.025, // text size
        "PuristaBold", // Text Font
        "CENTER", // Text Align
        true // Draw screen edge arrows
    ];
    
    _fade = [_baseColor,_color] call INFD_fnc_fadeColor;
    color = _fade;
    _client setVariable ["INF_iconColor",_fade, true];
    _client setVariable ["INF_iconOpacity",_opacity - .001];
};

if(_opacity - .001 <= 0) then {
  _client setVariable ["INF_showIcon",false,true];  
};