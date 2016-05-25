params ["_client","_iconType","_colorTo","_colorFrom","_opacity","_texture","_initTime"];

if (player distance _client < 100 ) then { //&& _client != player
    
_bbr = boundingBoxReal vehicle _client;
_p1 = _bbr select 0;
_p2 = _bbr select 1;
_maxHeight = abs ((_p2 select 2) - (_p1 select 2));

// Timing
_dispTime = serverTime - (_client getVariable "INF_IconStartTime");

    drawIcon3D [
        _texture, //Texture
        [_colorFrom select 0, _colorFrom select 1, _colorFrom select 2, _opacity], //Color
        [(getPosATL _client) select 0, (getPosATL _client) select 1, _maxHeight + .25], //DrawPosition
        0.5, //Texture width
        0.5, //Texture Height
        0, //Texture Angle
        name _client, //Icon Text
        2, // Nothing = 0, Shadow = 1, Outline = 2
        0.04, // text size
        "PuristaBold", // Text Font
        "CENTER", // Text Align
        true // Draw screen edge arrows
    ];
    
    
    /* Opacity Control */
    
    
    if (_dispTime < 3) then {
        _client setVariable ["INF_iconOpacity",1/_dispTime]; 
    };
    
    if (_dispTime >= 3 && _dispTime < 8) {
        _client setVariable ["INF_iconOpacity",_opacity - .002]; 
    };

    if (_dispTime >= 8) then {
        
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