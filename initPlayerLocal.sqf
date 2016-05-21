params["_client","_jip"];

//if (!hasInterface) exitWith {}; //Headless Client

waitUntil { _serverReady = missionNamespace getVariable ["INF_ServerStarted",false];
    !isNull player && _serverReady && !isNull (findDisplay 46) };
    
INF_ClientInitialized = false;

"SETUP" cutText ["Setting Up Client...","BLACK OUT",0,false];

[] call compile preProcessFileLineNumbers "Core\init.sqf";


if (_jip) then {
    _client globalChat format ["JIP - %1",name player];
};

_client call INF_fnc_spawnPlayer;

waitUntil { INF_ClientInitialized; };
"SETUP" cutText ["Setup Complete","BLACK IN",2,false]; 