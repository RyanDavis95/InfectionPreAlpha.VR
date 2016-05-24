private["_playedSongs","_totalSongs","_selected","_found"];

_playedSongs = player getVariable ["INF_playedMusic",[]];
_totalSongs = count INF_Songs;
_found = False;

if (count _playedSongs == _totalSongs) then {
    _playedSongs = [];
};

while {!_found} do {
    _selected = INF_Songs call BIS_fnc_selectRandom;
    
    if !(_selected in _playedSongs) then {
        _playedSongs pushBack _selected;
        player setVariable ["INF_playedMusic",_playedSongs,false];
        _found = True;
    };
};

playMusic _selected;