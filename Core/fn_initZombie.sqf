params ["_client"];

[_client,"ZOMBIE"] call INFS_fnc_setTeam;

/* Setup Event Handlers */
_client call INF_fnc_setupEVH;

_client call INF_fnc_setupGear;
_client setAnimSpeedCoef INF_ZombieSpeed;
_client call INF_fnc_BloodEffects;
_client call INF_fnc_glowEffects;