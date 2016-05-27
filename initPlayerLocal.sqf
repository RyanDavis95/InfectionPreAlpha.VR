params["_client","_jip"];

//if (!hasInterface) exitWith {}; //Headless Client

waitUntil { (missionNamespace getVariable ["INF_ServerStarted",false])
            && !isNull player && !isNull (findDisplay 46) };

//"SETUP" cutText ["Setting Up Client...","BLACK OUT",0,false];

_client call compile preProcessFileLineNumbers "Core\init.sqf";

waitUntil { _client getVariable ["INF_ClientReady",false] };

//"SETUP" cutText ["Setup Complete","BLACK IN",2,false];

INF_MessageQueue pushBack "WELCOME";

_client setVariable ["INF_KillStat",5,true];
_client spawn INFD_fnc_statDisplay;