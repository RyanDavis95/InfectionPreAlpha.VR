private ["_time"];

_time = serverTime + INFS_IntermissionTime;
"Starting new Round" remoteExec ["Hint",INFS_CurrentPlayers,false];
waitUntil { sleep 1; (serverTime >= _time)};
