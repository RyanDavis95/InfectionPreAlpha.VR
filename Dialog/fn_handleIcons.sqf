params ["_client"];

_baseColor = [0,1,1];//Put in Master config..
_opacity = _client getVariable ["INF_iconOpacity",1];


if (_x getVariable "INF_playerDead") then {
    _texture = root + "resources\Images\dead_CA.paa";
    [_client,"INF_playerDead",[1,0,0],[1,0,0],_opacity,_texture] call INFD_fnc_drawIcon;
} else
{
    _texture = root + "resources\Images\testTriangle_CA.paa";
    if (_x getVariable "INF_hitUnit") then {
        [_client,"INF_hitUnit",[0,1,1],[1,1,0],_opacity,_texture] call INFD_fnc_drawIcon;
    } else
    {
        if (_x getVariable "INF_playerFired") then {
            [_client,"INF_playerFired",[0,1,1],[0,1,1],_opacity,_texture] call INFD_fnc_drawIcon;
        };
    };
};