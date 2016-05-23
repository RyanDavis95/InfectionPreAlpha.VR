// need to specify Texture somehoe?
params ["_client","_iconType","_colorTo","_colorFrom","_opacity","_texture"];

if (player distance _client < 100 && _client != player) then {
    
_bbr = boundingBoxReal vehicle _client;
_p1 = _bbr select 0;
_p2 = _bbr select 1;
_maxHeight = abs ((_p2 select 2) - (_p1 select 2));
       
    drawIcon3D [
        _texture, //Texture
        [_colorFrom select 0, _colorFrom select 1, _colorFrom select 2, _opacity], //Color
        [(getPosATL _client) select 0, (getPosATL _client) select 1, _maxHeight + .25], //DrawPosition
        0.5, //Texture width
        0.5, //Texture Height
        0, //Texture Angle
        name _client, //Icon Text
        2, // Nothing = 0, Shadow = 1, Outline = 2
        0.025, // text size
        "PuristaBold", // Text Font
        "CENTER", // Text Align
        true // Draw screen edge arrows
    ];
        
    /* Opacity Control */
    if (_opacity > .7) then {
        _client setVariable ["INF_iconOpacity",_opacity - .001]; 
    } else {
        _client setVariable ["INF_iconOpacity",_opacity - .002]; 
    };

    /* Color Change Control */   
    if (_opacity < .85) then {
        _fade = [_colorTo,_colorFrom] call INFD_fnc_fadeColor;
        _client setVariable ["INF_iconColor",_fade, true];
    };

    /* Icon Display Control */
    if(_opacity <= 0) then {
        _client setVariable [_iconType,false,true]; 
    };  
};