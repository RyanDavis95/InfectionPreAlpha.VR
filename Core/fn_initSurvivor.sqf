params ["_client"];

[_client,"SURVIVOR"] call INFS_fnc_setTeam;

/* Setup Event Handlers */
_client call INF_fnc_setupEVH;

/* Appearance */
_client call INF_fnc_setupGear;
_client call INF_fnc_BloodEffects;

_client setAnimSpeedCoef (getNumber (missionConfigFile >> "INF_Settings" >> "Survivor_Speed"));

/* Abilities */
//_unit setVariable ["INF_SpeedBoosts",2,false];
//_unit setVariable ["INF_PlayerMines",2,false];
//_unit setVariable ["INF_PlayerHeals",3,false];

/* Perks and Abilities */
//_unit call INF_fnc_removePerks;
//_unit call INF_fnc_survPerkHUD;   
