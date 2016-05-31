params["_client","_jip"];
//if (!hasInterface) exitWith {}; //Headless Client
if (isPlayer _client) then {
    waitUntil { (missionNamespace getVariable ["INF_ServerStarted",false])
                && !isNull player && getClientState == "BRIEFING READ"};
    waitUntil { !isNull (findDisplay 46) };

    _client spawn INFD_fnc_welcomeScreen;

    _client call compile preProcessFileLineNumbers "Core\init.sqf";
    _client setVariable ["INF_ClientReady",true,true];

    waitUntil {_client getVariable ["INF_ClientReady",false]};
} else {
    _client call compile preProcessFileLineNumbers "Core\init.sqf";
    _client setVariable ["INF_ClientReady",true,true];
};
