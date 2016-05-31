/*
    Starting Locations must be named
    as 'startingLocation_x' x is anything
*/
private["_markers","_zoneArr","_zone"];

_markers = allMapMarkers;
_zoneArr = [];
{   
    _a = toArray _x;
    _a resize 17;
    if (toString _a == "startingLocation_") then {
        _zoneArr pushBack _x;
    };
} forEach _markers;

_zone = _zoneArr call BIS_fnc_selectRandom;

missionNamespace setVariable ["INF_Zone",_zone,true];