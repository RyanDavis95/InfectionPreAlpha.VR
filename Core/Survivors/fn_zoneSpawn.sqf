params ["_player","_pos","_maxDist"];
private ["_dist","_found","_dir"];

_found = false;
_genPos = [];

while {!_found} do {
    _dir = random 360;
    _x = cos (_dir);
    _y = sin (_dir);
    _xLength = random (_maxDist select 0);
    _yLength = random (_maxDist select 1);
    
    _genPos = [(_pos select 0) + (_x * _xLength), (_pos select 1) + (_y * _yLength), _pos select 2];
    
    
    //Set Pos Above Objects
    _tmpPos = getPos _player;
    _player setPos [_genPos select 0, _genPos select 1, 250];
    _height = (getPosATL _player select 2) - (getPos _player select 2); 
    _player setVelocity [0,0,0]; 
    _player setPos _tmpPos;
    _genPos set [2,_height];

    if (!surfaceIsWater _genPos) then {
        _found = true;
    };   
};

// Return Generated Position

_genPos
