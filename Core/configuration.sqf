params ["_client"];

                /* Backend Variables */
missionRoot = parsingNamespace getVariable "MISSION_ROOT";
_client setVariable ["INF_ClientReady",false,true];


                /* Icon Variables */

_client setVariable ["INF_iconColor", [0,1,1], true];
_client setVariable ["INF_hitUnit", false, true];
_client setVariable ["INF_playerFired", false, true];
_client setVariable ["INF_playerDead", false, true];