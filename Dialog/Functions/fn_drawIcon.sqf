params ["_client","_color"];

_z = _client call INF_fnc_getObjHeight;
_text = _client getVariable ["INF_IconText",name _client];
_texture = _client getVariable ["INF_IconTexture",""];

drawIcon3D [
        _texture, //Texture
        _color, //Color
        [(getPosATL _client) select 0, (getPosATL _client) select 1, _z + .25], //DrawPosition
        0.5, //Texture width
        0.5, //Texture Height
        0, //Texture Angle
        _text, //Icon Text
        2, // Nothing = 0, Shadow = 1, Outline = 2
        0.04, // text size
        "PuristaBold", // Text Font
        "CENTER", // Text Align
        true // Draw screen edge arrows
];