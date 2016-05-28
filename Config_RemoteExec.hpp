class Commands
{
        mode = 2;
        //jip = 1;

        //class setFuel {allowedTargets = 2;};           //execute only on server
        class hint {allowedTargets = 0;};
        class setObjectTextureGlobal {allowedTargets = 0;};
        class spawn {allowedTargets = 0;};                      
};
class Functions
{
        mode = 2;
        jip = 1;

        class INFS_fnc_updateStat {allowedTargets = 0;};
        class BIS_fnc_call {allowedTargets = 0;};
        class INF_fnc_spawnPlayer {allowedTargets = 1;};
        class INFS_fnc_setTeam {allowedTargets = 2;};
        class INF_fnc_initZombie {allowedTargets = 2;};
        class INF_fnc_initSurvivor {allowedTargets = 2;};
        class INFD_fnc_zombieMessage {allowedTargets = 0;};
        class INFD_fnc_playerInfected {allowedTargets = 0;};
        class INFD_fnc_survivorsEliminated {allowedTargets = 0;};
};