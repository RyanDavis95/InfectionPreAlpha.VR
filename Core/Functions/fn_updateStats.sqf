params ["_victim","_killer"];

// Update Kills
[_killer,"INF_pKills",1] remoteExec ["INFS_fnc_updateStat",2,false];

// Update XP
/*  To calculate XP, Create array for each person and store how much
    damage each person contributed based on hit EH and when killed
    forEach through that array and add some type of XP for each person
*/
[_killer,"INF_pXP",100] remoteExec ["INFS_fnc_updateStat",2,false];

// Update Deaths
[_victim,"INF_pDeaths",1] remoteExec ["INFS_fnc_updateStat",2,false];
