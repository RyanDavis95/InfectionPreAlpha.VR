params["_client","_jip"];


if (!hasInterface) exitWith {}; //Headless Client

waitUntil { !isNull player; };
INF_ClientInitialized = false;

"SETUP" cutText ["Setting Up Client...","BLACK OUT",0,false];

[] call compile preProcessFileLineNumbers "Core\init.sqf";


if (_jip) then {
    player globalChat format ["JIP - %1",name player];
    _client call INF_fnc_initZombie;
};

waitUntil { INF_ClientInitialized; };
"SETUP" cutText ["Setup Complete","BLACK IN",2,false]; 