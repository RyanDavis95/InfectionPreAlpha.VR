params ["_client"];

                /* Backend Variables */               
INF_MissionRoot = parsingNamespace getVariable "MISSION_ROOT";
_client setVariable ["INF_ClientReady",false,true];
_client setVariable ["INF_zomAttack",false,true];
_client setVariable ["INF_Team","UNASSIGNED",true];
INF_FrameCount = 0;
                /* Icon Variables */

_client setVariable ["INF_iconColor", [0,1,1], true];
_client setVariable ["INF_iconOpacity", 0, true];
_client setVariable ["INF_hitUnit", false, true];
_client setVariable ["INF_playerFired", false, true];
_client setVariable ["INF_playerDead", false, true];
_client setVariable ["INF_iconStartTime",serverTime,true];

// Damage Vars
_client setVariable ["INF_faceDmg",0,false];
_client setVariable ["INF_neckDmg",0,false];
_client setVariable ["INF_headDmg",0,false];
_client setVariable ["INF_pelvisDmg",0,false];
_client setVariable ["INF_abdomenDmg",0,false];
_client setVariable ["INF_diaphragmDmg",0,false];
_client setVariable ["INF_chestDmg",0,false];
_client setVariable ["INF_bodyDmg", 0,false];
_client setVariable ["INF_armsDmg",0,false];
_client setVariable ["INF_handsDmg",0,false];
_client setVariable ["INF_legsDmg",0,false];
_client setVariable ["INF_overallDmg",0,false];

// Icon Config
INF_KilledIconColor = getArray (missionConfigFile >> "INF_Settings" >> "KilledIconColor");
INF_EngagedIconColor = getArray (missionConfigFile >> "INF_Settings" >> "EngagedIconColor");
INF_DefaultIconColor = getArray (missionConfigFile >> "INF_Settings" >> "DefaultIconColor");

/* Misc */
INF_Songs = getArray (missionConfigFile >> "CfgMusic" >> "tracks");
INF_ZombieSpeed = getNumber (missionConfigFile >> "INF_Settings" >> "Survivor_Speed");
INF_SurvivorSpeed = getNumber (missionConfigFile >> "INF_Settings" >> "Zombie_Speed");