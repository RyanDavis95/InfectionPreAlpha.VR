params["_client","_jip"];
//if (!hasInterface) exitWith {}; //Headless Client

waitUntil { (missionNamespace getVariable ["INF_ServerStarted",false])
            && !isNull player && getClientState == "BRIEFING READ" && !isNull (findDisplay 46)};
            
/* Initialize Client */
//_client spawn INFD_fnc_welcomeScreen;
_client call compile preProcessFileLineNumbers "Core\init.sqf";

/* Set Client as Ready */
_client setVariable ["INF_Client_Ready",true,true];
waitUntil {_client getVariable ["INF_Client_Ready",false]};