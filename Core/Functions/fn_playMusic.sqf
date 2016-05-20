private["_selected","_totalSongs"];

_playedSongs = player getVariable ["INF_playedMusic",[]];
_totalSongs = count getArray (missionConfigFile >> "CfgMusic" >> "tracks");
_selected = getArray (missionConfigFile >> "CfgMusic" >> "tracks") call BIS_fnc_selectRandom;

if (count _playedSongs == _totalSongs) then {
    _playedSongs = [];
};

_unfound = true;
while {_unfound} do {
    if !(_selected in _playedSongs) then {
        _playedSongs pushBack _selected;
        player setVariable ["INF_playedMusic",_playedSongs,false];
        _unfound = false;
    } else {
        _selected = getArray (missionConfigFile >> "CfgMusic" >> "tracks") call BIS_fnc_selectRandom;
    };
};

playMusic _selected;
