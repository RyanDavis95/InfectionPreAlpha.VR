params ["_client"];

_ally = false;
if (_client in playableUnits && _client getVariable "INF_Client_Team" == player getVariable "INF_Client_Team") then {
     _ally = true;   
};


if ((_ally || _client in INFS_Lists_Graves) && _client != player) then {
        
        _texture = _client getVariable ["INF_Icons_Texture",""];
        _color = _client getVariable ["INF_Icons_Color",[0,1,1,1]];
        _alpha = linearConversion[5, 10, player distance _client, 1, 0, true];
        _text = _client getVariable["INF_Icons_Text",""];
        _sizeEx = linearConversion[5,10, player distance _client, .03, .015, true];
        
        _camDir = ([(positionCameraToWorld [0,0,0]), (positionCameraToWorld[0,0,1.5])] call BIS_fnc_vectorDiff);
    	_pos = ASLToATL ([eyePos _client, _camDir] call BIS_fnc_vectorAdd);

        drawIcon3D [
                _texture, //Texture
                [_color select 0, _color select 1, _color select 2, _alpha], //Color
                _pos, //DrawPosition
                0.5, //Texture width
                0.5, //Texture Height
                0, //Texture Angle
                _text, //Icon Text
                2, // Nothing = 0, Shadow = 1, Outline = 2
                _sizeEx, // text size
                "PuristaBold", // Text Font
                "CENTER", // Text Align
                false // Draw screen edge arrows
        ];
        // _camDir = ([(positionCameraToWorld [0,0,0]), (positionCameraToWorld[0,0,1.4])] call BIS_fnc_vectorDiff);
    	// _pos = ASLToATL ([eyePos _client, _camDir] call BIS_fnc_vectorAdd);
                drawIcon3D [
                "", //Texture
                [0, 0, 0, .8], //Color
                _pos, //DrawPosition
                0.5, //Texture width
                0.5, //Texture Height
                0, //Texture Angle
                "TEST", //Icon Text
                2, // Nothing = 0, Shadow = 1, Outline = 2
                _sizeEx, // text size
                "PuristaBold", // Text Font
                "CENTER", // Text Align
                false // Draw screen edge arrows
        ];

};