params["_client","_jip"];

//if (!hasInterface) exitWith {}; //Headless Client

waitUntil { (missionNamespace getVariable ["INF_ServerStarted",false])
            && !isNull player && !isNull (findDisplay 46) };

"SETUP" cutText ["Setting Up Client...","BLACK OUT",0,false];

_client call compile preProcessFileLineNumbers "Core\init.sqf";

if (_jip) then {
    _client remoteExecCall ["INFS_fnc_addJIP",2,false];
};

waitUntil { _client getVariable ["INF_ClientReady",false]; };
"SETUP" cutText ["Setup Complete","BLACK IN",2,false]; 