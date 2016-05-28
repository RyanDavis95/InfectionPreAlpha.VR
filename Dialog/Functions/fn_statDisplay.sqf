params ["_client"];

_time = serverTime;
INF_ShowingScore pushBack _time;

_assistXP = (_client getVariable ["INF_AssistStat",0]) * INF_AssistXP;
_killXP = (_client getVariable ["INF_KillStat",0]) * INF_KillXP;
_aTxt = "";
_kTxt = "";
if (_assistXP > 0) then {
    _aTxt = parseText format [
        "<t size='1' color='#ffffff' align='left'>%1</t>
        <t size='1' color='#fa3200' align='right'>%2</t><br/>",
        "Kill Assist: ","+"+str _assistXP
    ];
    
};

if (_killXP > 0) then {
    _kTxt = parseText format [
        "<t size='1' color='#ffffff' align='left'>%1</t>
        <t size='1' color='#fa3200' align='right'>%2</t><br/>",
        "Killed Zombie: ","+"+str _killXP
    ];
};

_xpTxt = parseText format [
    "<t size ='1.1' color='#ffffff' align='center'>%1</t>
    <t size='1.1' color='#FFD700' align='right'>%2</t<br/>",
    "Total: ","+"+str (_assistXP+_killXP)   
];


_handle = [composeText [_kTxt, _aTxt,_xpTxt],[safeZoneX + .05,safeZoneY+safeZoneH - .2,.5,.15],[10,3],5,.5,0] spawn BIS_fnc_textTiles;
waitUntil { scriptDone _handle; };

INF_ShowingScore = INF_ShowingScore - [_time];

if (INF_ShowingScore isEqualTo []) then {
    _client setVariable ["INF_AssistStat",0,true];
    _client setVariable ["INF_KillStat",0,true];
};