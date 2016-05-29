params ["_client"];

[_client,"ZOMBIE"] call INFS_fnc_setTeam;

/* Setup Event Handlers */
_client call INF_fnc_setupEVH;

_client call INF_fnc_setupGear;
_client setAnimSpeedCoef INF_ZombieSpeed;
_client call INF_fnc_BloodEffects;
_client call INF_fnc_glowEffects;

_client setVariable ["INF_HeadDmg",0,true];
_client setVariable ["INF_OtherDmg",0,true];