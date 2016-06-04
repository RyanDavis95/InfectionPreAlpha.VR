/* Round Variables */
INFS_GameInProgress = False;
INFS_RoundNumber = 0;
INFS_RoundStartTime = serverTime;
INFS_RoundLocation = "";
INFS_PickingZom = False;

/* Lists Of Things */
INFS_CurrentPlayers = [];
INFS_Zombies = [];
INFS_Survivors = [];
INFS_Unassigned = [];
INFS_SpawnedStructures = [];
INFS_JIPQueue = [];

/* Backend Vars */
missionNamespace setVariable ["INF_Settings_Zone","",true];
missionNamespace setVariable ["INF_GameInProgress",false,true];
INFS_MinPlayers = getNumber (missionConfigFile >> "INF_Settings" >> "minPlayers");
INFS_ScoreVars = getArray (missionConfigFile >> "INF_Settings" >> "playerStats");
INFS_ItemDrops = getArray (missionConfigFile >> "INF_Settings" >> "itemDrops");
INFS_IntermissionTime = getNumber (missionConfigFile >> "INF_Settings" >> "intermissionTime");
INFS_Settings_TimeLimit = getNumber (missionConfigFile >> "INF_Settings" >> "MaxRoundTime");
INF_ShowingStats = [];

/* Disable Players */
{
    _x enableSimulationGlobal false;
} forEach playableUnits;