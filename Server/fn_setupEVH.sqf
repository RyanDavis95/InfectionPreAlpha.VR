addMissionEventHandler ["PlayerConnected",{_this call INFS_fnc_connectedPlayer}];
addMissionEventHandler ["HandleDisconnect",{_this call INFS_fnc_disconnectedPlayer}];
addMissionEventHandler ["EntityKilled",{_this call INFS_fnc_unitKilled}];
addMissionEventHandler ["EntityRespawned",{_this call INFS_fnc_unitRespawned}];