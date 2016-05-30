params ["_client"];

                /* Backend Variables */               
INF_MissionRoot = parsingNamespace getVariable "MISSION_ROOT";
_client setVariable ["INF_ClientReady",false,true];
_client setVariable ["INF_zomAttack",false,true];
_client setVariable ["INF_Team","UNASSIGNED",true];
_client setVariable ["INF_ItemDropped",false];
INF_Settings_FrameCount = 0;
INF_Settings_CurrentMessage = [] spawn {};
INF_Settings_IconRefreshRate = getNumber (missionConfigFile >> "INF_Settings" >> "IconRefreshRate");
INF_Settings_SurvivorSpeed = getNumber (missionConfigFile >> "INF_Settings" >> "Survivor_Speed");
INF_Settings_ZombieSpeed = getNumber (missionConfigFile >> "INF_Settings" >> "Zombie_Speed");

                /* Icon Variables */
_client setVariable ["INF_DisplayIcon",false,true];
_client setVariable ["INF_IconTime",serverTime,true];
_client setVariable ["INF_IconType","",true];

// Icon Config
INF_KilledIconColor = getArray (missionConfigFile >> "INF_Settings" >> "KilledIconColor");
INF_EngagedIconColor = getArray (missionConfigFile >> "INF_Settings" >> "EngagedIconColor");
INF_DefaultIconColor = getArray (missionConfigFile >> "INF_Settings" >> "DefaultIconColor");

/* Misc */
INF_Songs = getArray (missionConfigFile >> "CfgMusic" >> "tracks");
INF_ZombieSpeed = getNumber (missionConfigFile >> "INF_Settings" >> "Survivor_Speed");
INF_SurvivorSpeed = getNumber (missionConfigFile >> "INF_Settings" >> "Zombie_Speed");

/* Stats */
INF_KillXP = getNumber (missionConfigFile >> "INF_Settings" >> "KillXP");
INF_AssistXP = getNumber (missionConfigFile >> "INF_Settings" >> "AssistXP");
INF_HeadshotXP = getNumber (missionConfigFile >> "INF_Settings" >> "HeadshotXP");
_client setVariable ["INF_AssistStat",0,true];
_client setVariable ["INF_KillStat",0,true];
_client setVariable ["INF_ShowStats",false,true];
_client setVariable ["INF_AssistSources",[],true];