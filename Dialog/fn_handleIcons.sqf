params ["_client"];

_opacity = _client getVariable ["INF_iconOpacity",1];

if (_client getVariable "INF_playerDead") then {
    _texture = INF_MissionRoot + "resources\Images\dead_CA.paa";
    _color = INF_KilledIconColor;
    [_client,"INF_playerDead",_color,_color,_opacity,_texture,serverTime] call INFD_fnc_drawIcon;
} else
{
    _texture = INF_MissionRoot + "resources\Images\testTriangle_CA.paa";
    if (_client getVariable "INF_hitUnit") then {
        _color = INF_EngagedIconColor;
        if (_opacity < 1) then {
            _color = _client getVariable "INF_iconColor";
        };
        _defaultColor = INF_DefaultIconColor;
        [_client,"INF_hitUnit",_defaultColor,_color,_opacity,_texture,serverTime] call INFD_fnc_drawIcon;
    } else
    {
        if (_client getVariable "INF_playerFired") then {
            _color = INF_DefaultIconColor;
            [_client,"INF_playerFired",_color,_color,_opacity,_texture,serverTime] call INFD_fnc_drawIcon;
        };
    };
};
