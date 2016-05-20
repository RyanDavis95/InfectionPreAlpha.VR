params ["_victim","_killer"];

// Update Kills
[_killer,"INF_pKills",1] remoteExec ["INFS_fnc_updateStat",2,false];

// Update XP
[_killer,"INF_pXP",100] remoteExec ["INFS_fnc_updateStat",2,false];

// Update Deaths
[_victim,"INF_pDeaths",1] remoteExec ["INFS_fnc_updateStat",2,false];
