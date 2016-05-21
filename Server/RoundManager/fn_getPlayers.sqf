_minPlayers = getNumber (missionConfigFile >> "INF_Settings" >> "minPlayers");

waitUntil {
            INF_CurrentPlayers = [] call BIS_fnc_listPlayers;
            
            if(count INF_CurrentPlayers >= _minPlayers) then {
                player globalChat "Starting Match";
                missionNamespace setVariable ["INF_RoundReady",true,true];
                sleep .1;
            } else {
                player globalChat "Waiting for more players..";
                sleep 10;
            };
            missionNamespace setVariable ["INF_RoundReady",false,true];
            count INF_CurrentPlayers >= _minPlayers
        };