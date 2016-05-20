params ["_player","_pos","_maxDist"];
private ["_dist","_found"];

_found = false;
while {!_found} do {
    _dist = random _maxDist;
    _genPos = [(getpos _pos select 0) + ((_dist)*sin(getdir _pos )),
        (getpos _pos select 1) + ((_dist)*cos(getdir _pos)),
        (getPos _pos select 2)];
    
    
    //Set Pos Above Objects
	_genPos set [2, worldSize]; 
	_player setPosASL _genPos;
	_pos set [2, vectorMagnitude (_genPos vectorDiff getPosVisual _player)];
	_obj setPosASL _pos;
    
    
    
    if (!surfaceIsWater _genPos) then {
        _found = true;
    };   
};
    
// Return Generated Position
_genPos
