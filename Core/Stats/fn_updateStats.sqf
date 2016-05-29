params ["_victim","_kiler"];
private ["_time","_kills","_assists","_headshots","_totalXP","_killXP",
"_assistXP","_headshotXP","_aTxt","_kTxt","_hsTxt","_handle"];

/* Queue Stat Update */
_time = serverTime;
INF_ShowingStats pushBack _time;

/* Init Variables */
_kills = _killer getVariable ["INF_Stat_Kills",0];
_assists = _killer getVariable ["INF_Stat_Assists",0];
_headshots = _killer getVariable ["INF_Stat_Headshots",0];
_allAssists = _victim getVariable ["INF_Stat_ListAssists",[]];

_totalXP = 0;
_killXP = _kills * INF_KillXP;
_assistXP = _assists * INF_AssistXP;
_headshotXP = _headshots * INF_HeadshotXP;
_aTxt = "";
_kTxt = "";
_hsTxt = "";

/* Manage Assists */
if (_killer in _allAssists) then {
    _allAssists = _allAssists - [_killer];
};
{
    [_x,"INF_Stat_Assists"] call INF_fnc_incStat; 
    _x remoteExec ["INF_updateStats",_x,false];
} forEach _allAssists;

/* Kill XP Text */
if (_killXP > 0) then {
    _kTxt = parseText format [
        "<t size='.8' color='#ffffff' align='left'>%1</t>
        <t size='.8' color='#fa3200' align='right'>%2</t><br/>",
        "Killed Zombie: ","+"+str _killXP
    ];
};

/* Assist XP Text */
if (_assistXP > 0) then {
    _aTxt = parseText format [
        "<t size='.8' color='#ffffff' align='left'>%1</t>
        <t size='.8' color='#fa3200' align='right'>%2</t><br/>",
        "Kill Assist: ","+"+str _assistXP
    ];   
};

/* Headshot XP Text */
if (_headshotXP > 0) then {
    _hsTxt = parseText format [
        "<t size ='.8' color='#ffffff' align='left'>%1</t>
        <t size='.8' color='#fa3200' align='right'>%2</t><br/>",
        "Headshot: ","+"+str _headshotXP   
    ];
};

/* Total XP Text */
_xpTxt = parseText format [
    "<t size ='1' color='#ffffff' align='center'>%1</t>
    <t size='1' color='#FFD700' align='right'>%2</t><br/>",
    "Total: ","+"+str (_assistXP+_killXP+_headshotXP)   
];

/* Draw Stat Text to Screen */
_handle = [
        composeText [_kTxt, _hsTxt, _aTxt, _xpTxt],
        [safeZoneX + .05,safeZoneY+safeZoneH - .2,.5,.15],
        [10,3],5,.5,0
    ] spawn BIS_fnc_textTiles;   
waitUntil { scriptDone _handle; };

/* DeQueue Message */
INF_ShowingScore = INF_ShowingScore - [_time];
if !(INF_ShowingScore isEqualTo []) exitWith {}; // Exit if there are more stat updates

if (_killer != _victim) then {
    
    /* Update Stats on Server */
    [_killer,"INF_Stat_Kills",_kills] remoteExec ["INFS_fnc_updateStat",2,false];
    [_killer,"INF_Stat_Assists",_assists] remoteExec ["INFS_fnc_updateStat",2,false];
    [_killer,"INF_Stat_Headshots",_headshots] remoteExec ["INFS_fnc_updateStat",2,false];
    [_killer,"INF_Stat_XP",_totalXP] remoteExec ["INFS_fnc_updateStat",2,false];
    
    /* Display Clickers on Client */
    [[],INFD_fnc_statDisplay] remoteExec ["BIS_fnc_Spawn",_killer,false];
};

[_victim,"INF_Stat_Deaths",1] remoteExec ["INFS_fnc_updateStat",2,false];