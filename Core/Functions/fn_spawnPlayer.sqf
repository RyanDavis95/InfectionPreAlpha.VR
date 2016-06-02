params ["_client"];
private ["_found","_genPos","_zone","_pos"];

if (missionNamespace getVariable ["INF_Settings_Zone",""] == "") exitWith {getPos _client};

_found = false;
_genPos = [];
_zone = missionNamespace getVariable "INF_Settings_Zone";
_pos = getMarkerPos _zone;

private ["_dir","_x","_y","_xLength","_yLength","_tmpPos",]
while {!_found} do {
    _dir = random 360;
    _x = cos (_dir);
    _y = sin (_dir);
    _xLength = random ((getMarkerSize _zone) select 0);
    _yLength = random ((getMarkerSize _zone) select 1);
    
    _genPos = [(_pos select 0) + (_x * _xLength), (_pos select 1) + (_y * _yLength), _pos select 2];    
    
    //Set Pos Above Objects
    _tmpPos = getPos _client;
    _client modelToWorld [0,0,500];

    _height = (getPosATL _client select 2) - (getPos _client select 2); 
    _client setVelocity [0,0,0]; 
    _client setPos _tmpPos;
    _genPos set [2,_height];

    if (!surfaceIsWater _genPos) then {
        _found = true;
    };   
};

_client setPos _genPos;