params ["_client"];

_assists = _client getVariable ["INF_AssistStat",0];
_kills = _client getVariable ["INF_KillStat",0];
_aTxt = "";
_kTxt = "";
if (_assists > 0) then {
    _aTxt = parseText format [
        "<t size='1.5' color='#ffffff' align='left'>%1</t>
        <t size='1.5' color='#fa3200' align='right'>%2</t><br/>",
        "Kill Assist: ","+"+str(50*_assists)
    ];
    
};

if (_kills > 0) then {
    _kTxt = parseText format [
        "<t size='1.5' color='#ffffff' align='left'>%1</t>
        <t size='1.5' color='#fa3200' align='right'>%2</t><br/>",
        "Killed Zombie: ","+"+str(100*_kills)
    
};

_handle = [_kTxt + _aTxt,[safeZoneX + .1,safeZoneY+safeZoneH - .3,.5,.2],[10,8],5,.5,0] spawn BIS_fnc_textTiles;
waitUntil { scriptDone _handle; };

_client setVariable ["INF_AssistStat",0,true];
_client setVariable ["INF_KillStat",0,true];
