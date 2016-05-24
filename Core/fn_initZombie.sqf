params ["_client"];

[_client,"ZOMBIE"] call INFS_fnc_setTeam;

_client call INF_fnc_zomConfig;

/* Setup Event Handlers */
_client call INF_fnc_setupEVH;


_client call INF_fnc_setupGear;
_client setAnimSpeedCoef (getNumber (missionConfigFile >> "INF_Settings" >> "Zombie_Speed"));
_client call INF_fnc_BloodEffects;
_client call INF_fnc_glowEffects;