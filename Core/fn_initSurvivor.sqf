params ["_client"];

_client setVariable ["INF_Client_Team","SURVIVOR",true];

/* Setup Event Handlers */
_client call INF_fnc_setupEVH;

/* Appearance */
_client call INF_fnc_setupGear;
_client call INF_fnc_BloodEffects;
_client setAnimSpeedCoef INF_Settings_SurvivorSpeed;
[_client,"NORMAL"] spawn INF_fnc_modIcon;
_client setVariable ["INF_Client_GraveSpawned",false,true];