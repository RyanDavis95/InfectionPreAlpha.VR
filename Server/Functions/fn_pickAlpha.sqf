_alpha = INF_CurrentPlayers call BIS_fnc_SelectRandom;
_alpha spawn {
    INF_PickingZom = true;
    format ["Picking new Zombie"] remoteExec ["Hint",0,false];
    sleep 10;
    format ["%1 is the Alpha Zombie!",name _this] remoteExec ["Hint",0,false];
    [_this,"ZOMBIE"] call INFS_fnc_setTeam;
    _this remoteExec ["INF_fnc_initZombie",_this,false];
    INF_PickingZom = false;
};