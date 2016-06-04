private["_played","_totalSongs","_found","_selected"];

_played = INF_Settings_PlayedSongs;
_totalSongs = count INF_Settings_Songs;
_found = False;

if (count _played == _totalSongs) then {
    _played = [];
};

while {!_found} do {
    _selected = selectRandom INF_Settings_Songs;
    
    if !(_selected in _played) then {
        _played pushBack _selected;
        INF_Settings_playedSongs = _played;
        _found = True;
    };
};

playMusic _selected;