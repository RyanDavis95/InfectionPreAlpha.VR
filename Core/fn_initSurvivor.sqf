params ["_player"];

[_player,"SURVIVOR"] call INFS_fnc_setTeam;

/* Setup Event Handlers */
_player call INF_fnc_setupEVH;
_player call INF_fnc_setupGear;

/* Abilities */
//_unit setVariable ["INF_SpeedBoosts",2,false];
//_unit setVariable ["INF_PlayerMines",2,false];
//_unit setVariable ["INF_PlayerHeals",3,false];

/* Perks and Abilities */
//_unit call INF_fnc_removePerks;
//_unit call INF_fnc_survPerkHUD;   
