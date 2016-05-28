params ["_victim","_killer"];

// Update Kills
if (_victim != _killer) then {
    [_killer,"INF_PlayerKills",1] remoteExec ["INFS_fnc_updateStat",0,true];
    [_killer,{
        _curr = _this getVariable ["INF_killStat",0];
        _this setVariable ["INF_KillStat",1+_curr,true];
        _this spawn INFD_fnc_statDisplay;
    }]  remoteExec ["BIS_fnc_Call",_killer,false];


    [_killer,"INF_PlayerXP",100] remoteExec ["INFS_fnc_updateStat",0,true];
    
    
};

// Update Deaths
[_victim,"INF_PlayerDeaths",1] remoteExec ["INFS_fnc_updateStat",0,true];
