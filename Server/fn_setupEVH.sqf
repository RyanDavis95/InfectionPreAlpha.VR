addMissionEventHandler ["PlayerConnected",{call INFS_fnc_connectedPlayer}];
addMissionEventHandler ["HandleDisconnect",{call INFS_fnc_disconnectedPlayer}];
addMissionEventHandler ["EntityKilled",{call INFS_fnc_unitKilled}];