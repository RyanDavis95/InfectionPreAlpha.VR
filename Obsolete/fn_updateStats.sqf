params ["_victim","_killer"];

// Update Kills
if (_victim != _killer) then {
    [_killer,"INF_PlayerKills",1] remoteExec ["INFS_fnc_updateStat",0,true];
    [[_victim,_killer],{
        
        _victim = _this select 0;
        _killer = _this select 1;
        
        /* Handle Kills */
        _currKills = _killer getVariable ["INF_killStat",0];
        _killer setVariable ["INF_KillStat",1+_currKills,true];
        
        /* Handle Assists */
        {
            _currAssists = _x getVariable ["INF_AssistStat",0];
            _x setVariable ["INF_AssistStat",1+_currAssists,true];
            _x spawn INFD_fnc_statDisplay;

        } forEach (_victim getVariable ["INF_AssistSources",[]]);
        
        /* Show XP Clickers */
        _killer spawn INFD_fnc_statDisplay;
        
    }]  remoteExec ["BIS_fnc_Call",_killer,false];


    [_killer,"INF_PlayerXP",100] remoteExec ["INFS_fnc_updateStat",0,true];
    
    
};

// Update Deaths
[_victim,"INF_PlayerDeaths",1] remoteExec ["INFS_fnc_updateStat",0,true];