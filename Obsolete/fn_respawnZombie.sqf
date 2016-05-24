params ["_unit"];

_teams = [] call INFS_fnc_updateTeams;

_survivors = _teams select 0;
_zombies = _teams select 0;
_survGroups = [];
_grpRange = 15;
_searching = true;
_spawnArea = [100,100];
_minProximity = 50;
_genPos = [];

while {_searching} do {
    _survPositions = [];
        {
            _survPositions pushBack (getPosATL _x); 
        } forEach _survivors;
            
        if !(_survPositions isEqualTo []) then {
      
        _randPos = _survPositions call BIS_fnc_SelectRandom;
        _genPos = [_randPos,_spawnArea] call INF_fnc_generatePos;
        _searching = false;
        
        {
            if (_genPos distance _x < _minProximity || surfaceIsWater _genPos) 
            exitWith {_searching = false;};
            
        } forEach _survPositions;
    } else {
      _genPos = getPosATL _unit;
    };

};

_unit setPosATL _genPos;

//[_unit,_genPos,0] call KK_fnc_setPosAGLS;