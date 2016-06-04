params ["_client"];

_texture = _client getVariable ["INF_Icons_Texture",""];
_color = _client getVariable ["INF_Icons_Color",[0,1,1,1]];
_alpha = linearConversion[5, 10, player distance _client, 1, 0, true];

drawIcon3D [
        _texture, //Texture
        [_color select 0, _color select 1, _color select 2, _alpha], //Color
        _client modelToWorld [0,0,2.25], //DrawPosition
        0.5, //Texture width
        0.5, //Texture Height
        0, //Texture Angle
        name _client, //Icon Text
        2, // Nothing = 0, Shadow = 1, Outline = 2
        0.03, // text size
        "PuristaBold", // Text Font
        "CENTER", // Text Align
        false // Draw screen edge arrows
];