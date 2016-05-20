params["_client","_jip"];

if (!hasInterface) exitWith {}; //Headless Client

waitUntil { _serverReady = missionNamespace getVariable ["INF_ServerStarted",false];
    !isNull player && _serverReady };
    
INF_ClientInitialized = false;

"SETUP" cutText ["Setting Up Client...","BLACK OUT",0,false];

[] call compile preProcessFileLineNumbers "Core\init.sqf";

_ended = missionNamespace getVariable "INF_RoundEnded";
if (_jip && !_ended) then {
    _client globalChat format ["JIP - %1",name player];
    _client call INF_fnc_initZombie;
};

waitUntil { INF_ClientInitialized; };
"SETUP" cutText ["Setup Complete","BLACK IN",2,false]; 