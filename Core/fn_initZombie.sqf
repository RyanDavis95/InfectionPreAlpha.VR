params ["_player"];

[_player,"ZOMBIE"] call INFS_fnc_setTeam;

_player call INF_fnc_zomConfig;

/* Setup Event Handlers */
_player call INF_fnc_setupEVH;


_player call INF_fnc_setupGear;
_player setAnimSpeedCoef 1.2;
_player call INF_fnc_BloodEffects;
_player call INF_fnc_glowEffects;