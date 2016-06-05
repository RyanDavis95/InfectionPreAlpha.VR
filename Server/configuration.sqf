/* Round Variables */
INFS_Round_InProgress = False;
INFS_Round_Number = 0;
INFS_Round_StartTime = serverTime;
INFS_Round_Location = "";
INFS_Round_PickingZombie = False;

/* Lists Of Things */
INFS_Lists_Players = [];
INFS_Lists_Zombies = [];
INFS_Lists_Survivors = [];
INFS_Lists_Unassigned = [];
INFS_Lists_DeadPlayers = [];
INFS_Lists_Graves = [];
INFS_Lists_Drops = [];

/* Backend Vars */
missionNamespace setVariable ["INF_Settings_Zone","",true];
missionNamespace setVariable ["INF_GameInProgress",false,true];
INFS_Settings_MinPlayers = getNumber (missionConfigFile >> "INF_Settings" >> "minPlayers");
INFS_Settings_ScoreVars = getArray (missionConfigFile >> "INF_Settings" >> "playerStats");
INFS_Settings_ItemDrops = getArray (missionConfigFile >> "INF_Settings" >> "itemDrops");
INFS_Settings_IntermissionTime = getNumber (missionConfigFile >> "INF_Settings" >> "intermissionTime");
INFS_Settings_TimeLimit = getNumber (missionConfigFile >> "INF_Settings" >> "MaxRoundTime");


/* Disable Players */
{
    _x enableSimulationGlobal false;
} forEach playableUnits;