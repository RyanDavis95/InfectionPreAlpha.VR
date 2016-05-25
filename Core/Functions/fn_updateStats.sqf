params ["_victim","_killer"];

// Update Kills
if (_victim != _killer) then {
    [_killer,"INF_PlayerKills",1] remoteExec ["INFS_fnc_updateStat",0,true];
    
    // Update XP
    /*  
        To calculate XP, Create array for each person and store how much
        damage each person contributed based on hit EH and when killed
        forEach through that array and add some type of XP for each person
    */
    [_killer,"INF_PlayerXP",100] remoteExec ["INFS_fnc_updateStat",0,true];
};

// Update Deaths
[_victim,"INF_PlayerDeaths",1] remoteExec ["INFS_fnc_updateStat",0,true];
