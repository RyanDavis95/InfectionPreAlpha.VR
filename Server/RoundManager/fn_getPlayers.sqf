_minPlayers = getNumber (missionConfigFile >> "INF_Settings" >> "minPlayers");

waitUntil {
            INF_CurrentPlayers = [] call BIS_fnc_listPlayers;
            _ready = true;
            if(count INF_CurrentPlayers >= _minPlayers) then {           
                // {
                //     if !(_x getVariable ["INF_ClientReady",false]) then {
                //         _ready = false;
                //         "Initializing Players..." remoteExec ["Hint",0,false];
                //     };
                // } forEach INF_CurrentPlayers;
                
                if (count INF_CurrentPlayers >= _minPlayers && _ready) exitWith {
                    "Starting Match" remoteExec ["Hint",0,false]; true
                };
            } else {
                "Waiting for more players..." remoteExec ["Hint",0,false];
                sleep 2;
            };
        };
        