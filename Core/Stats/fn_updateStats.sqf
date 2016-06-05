params ["_victim","_killer"];
private ["_time","_kills","_assists","_headshots","_totalXP","_killXP",
"_assistXP","_headshotXP","_aTxt","_kTxt","_hsTxt","_handle"];

/* Queue Stat Update */
_time = serverTime;

/* Init Variables */
_kills = _killer getVariable "INF_Stats_Kills";
_assists = _killer getVariable "INF_Stats_Assists";
_headshots = _killer getVariable "INF_Stats_Headshots";
_attackers = _victim getVariable "INF_Stats_Attackers";

_killXP = _kills * INF_Stats_KillXP;
_assistXP = _assists * INF_Stats_AssistXP;
_headshotXP = _headshots * INF_Stats_HeadshotXP;
//hint format ["%1\n%2\n%3",_headshots,INF_Stats_HeadshotXP,_headshotXP];
_aTxt = "";
_kTxt = "";
_hsTxt = "";
_xpTxt = "";

/* Manage Assists */
if (_killer in _attackers) then {
    _attackers = _attackers - [_killer];
};
{
    [_x,"INF_Stats_Assists"] call INF_fnc_incStat; 
    [[_victim,_x],"INF_fnc_updateStats"] remoteExec ["BIS_fnc_Spawn",_x,false];
} forEach _attackers;

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

_totalXP = _assistXP + _killXP + _headshotXP;

/* Total XP Text */
if (_totalXP > 0) then {
    _xpTxt = parseText format [
        "<t size ='1' color='#ffffff' align='center'>%1</t>
        <t size='1' color='#FFD700' align='right'>%2</t><br/>",
        "Total: ","+"+str (_totalXP)   
    ];
};

/* Suspend Last Draw */
terminate INF_Stats_Current;

/* Draw Stat Text to Screen */
INF_Stats_Current = [
        composeText [_kTxt, _hsTxt, _aTxt, _xpTxt],
        [safeZoneX + .05,safeZoneY+safeZoneH - .2,.5,.15],
        [10,3],5,.5,0
    ] spawn BIS_fnc_textTiles;   
waitUntil { scriptDone INF_Stats_Current; };

/* Show Stats on Client */
if (_killer != _victim) then {   
    _killer remoteExec ["INFS_fnc_savePlayerStats",2,false];
};