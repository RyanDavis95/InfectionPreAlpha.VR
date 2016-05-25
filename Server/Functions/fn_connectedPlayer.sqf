params ["_id","_uid","_name","_jip","_owner"];

_client = objectFromNetId _uid;

if (_jip) then {
    
    INFS_JIPQueue pushBack _client;
    
    //[_client,"ZOMBIE"] call INFS_fnc_setTeam; //Should be set in initZom
    _client call INFS_fnc_initScoreVars;
    _client remoteExec ["INF_fnc_initZombie",_client,false];
    _client remoteExec ["INF_fnc_spawnPlayer",_client,false];
  
    INFS_JIPQueue = INF_JIPQueue - _client;  
};