params["_client","_jip"];

hint format ["%1\%2",_client,_jip];
if (!hasInterface) exitWith {}; //Headless Client

INF_ClientInitialized = false;

"SETUP" cutText ["Setting Up Client...","BLACK OUT",0,false];

[] call compile preProcessFileLineNumbers "Core\init.sqf";


if (_jip) then {
    _client call INF_fnc_initZombie;
};

waitUntil { INF_ClientInitialized; };
"SETUP" cutText ["Setup Complete","BLACK IN",2,false]; 