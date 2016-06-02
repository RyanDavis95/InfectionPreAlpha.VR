params ["_client"];

/* Backend Variables */               
INF_MissionRoot = parsingNamespace getVariable "MISSION_ROOT";
INF_Settings_FrameCount = 0;
INF_Settings_CurrentMessage = [] spawn {};
INF_Settings_IconRefreshRate = getNumber (missionConfigFile >> "INF_Settings" >> "IconRefreshRate");
INF_Settings_SurvivorSpeed = getNumber (missionConfigFile >> "INF_Settings" >> "Survivor_Speed");
INF_Settings_ZombieSpeed = getNumber (missionConfigFile >> "INF_Settings" >> "Zombie_Speed");
INF_Settings_ZombieAttackDamage = getNumber (missionConfigFile >> "INF_Settings" >> "Zombie_AttackDamage");
INF_Settings_ZombieSpeed = getNumber (missionConfigFile >> "INF_Settings" >> "Survivor_Speed");
INF_Settings_SurvivorSpeed = getNumber (missionConfigFile >> "INF_Settings" >> "Zombie_Speed");


/* Player Variables */
_client setVariable ["INF_Client_ClientReady",false,true];
_client setVariable ["INF_Client_zomAttack",false,true];
_client setVariable ["INF_Client_Team","UNASSIGNED",true];
_client setVariable ["INF_Client_ItemDropped",false];
_client setVariable ["INF_Client_isJumping",false,true];
_client setVariable ["INF_Client_AssistStat",0,true];
_client setVariable ["INF_Client_KillStat",0,true];
_client setVariable ["INF_Client_ShowStats",false,true];
_client setVariable ["INF_Client_AssistSources",[],true];
_client setVariable ["INF_Client_DisplayIcon",false,true];
_client setVariable ["INF_Client_IconTime",serverTime,true];
_client setVariable ["INF_Client_IconType","",true];


// Icon Config
INF_Icons_KilledIconColor = getArray (missionConfigFile >> "INF_Settings" >> "KilledIconColor");
INF_Icons_EngagedIconColor = getArray (missionConfigFile >> "INF_Settings" >> "EngagedIconColor");
INF_Icons_DefaultIconColor = getArray (missionConfigFile >> "INF_Settings" >> "DefaultIconColor");


/* Misc */
INF_Misc_Songs = getArray (missionConfigFile >> "CfgMusic" >> "tracks");


/* Stats */
INF_Stats_KillXP = getNumber (missionConfigFile >> "INF_Settings" >> "KillXP");
INF_Stats_AssistXP = getNumber (missionConfigFile >> "INF_Settings" >> "AssistXP");
INF_Stats_HeadshotXP = getNumber (missionConfigFile >> "INF_Settings" >> "HeadshotXP");