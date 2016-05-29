params ["_client"];
private ["_zone","_pos"];

if (missionNamespace getVariable ["INF_Zone",""] == "") exitWith {getPos _client};

_found = false;
_genPos = [];
_zone = missionNamespace getVariable "INF_Zone";
_pos = getMarkerPos _zone;


while {!_found} do {
    _dir = random 360;
    _x = cos (_dir);
    _y = sin (_dir);
    _xLength = random ((getMarkerSize _zone) select 0);
    _yLength = random ((getMarkerSize _zone) select 1);
    
    _genPos = [(_pos select 0) + (_x * _xLength), (_pos select 1) + (_y * _yLength), _pos select 2];    
    
    //Set Pos Above Objects
    _tmpPos = getPos _client;
    _client setPos [_genPos select 0, _genPos select 1, 500];

    _height = (getPosATL _client select 2) - (getPos _client select 2); 
    _client setVelocity [0,0,0]; 
    _client setPos _tmpPos;
    _genPos set [2,_height];

    if (!surfaceIsWater _genPos) then {
        _found = true;
    };   
};

_client setPos _genPos;