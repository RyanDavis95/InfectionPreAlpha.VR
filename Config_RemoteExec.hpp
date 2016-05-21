class Commands
{
        mode = 1;

        //class setFuel {allowedTargets = 2;};           //execute only on server
        //class hint {jip = 0;};                         
};
class Functions
{
        mode = 2;
        jip = 1;

        class INFS_fnc_updateStat {allowedTargets = 2;};
        class BIS_fnc_call {allowedTargets = 0;};
        class INF_fnc_spawnPlayer {allowedTargets = 1;};
        class INFS_fnc_setTeam {allowedTargets = 2;};
};