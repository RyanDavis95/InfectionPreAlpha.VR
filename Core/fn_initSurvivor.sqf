params ["_client"];

_client setVariable ["INF_Team","SURVIVOR",true];

/* Setup Event Handlers */
_client call INF_fnc_setupEVH;

/* Appearance */
_client call INF_fnc_setupGear;
_client call INF_fnc_BloodEffects;
_client setAnimSpeedCoef INF_Settings_SurvivorSpeed;