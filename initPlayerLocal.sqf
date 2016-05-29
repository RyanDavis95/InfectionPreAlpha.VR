params["_client","_jip"];
//if (!hasInterface) exitWith {}; //Headless Client
if (isPlayer _client) then {
    waitUntil { (missionNamespace getVariable ["INF_ServerStarted",false])
                && !isNull player && getClientState == "BRIEFING READ"};
    waitUntil { !isNull (findDisplay 46) };

    "SETUP" cutText ["Setting Up Client...","BLACK OUT",0,false];
    _handle = [
        [
            ["ARMA III: ","align = 'center' shadow = '1' size = '2.5' font='PuristaBold'"],
            ["INFECTION","align = 'center' shadow = '1' size = '2.5'","#ffff00"],
            ["","<br/>"],
            ["Welcome to the Fray...","align = 'center' shadow = '2' size = '1.5'"]
        ],-.2,1
    ] spawn BIS_fnc_typeText2;

    waitUntil { scriptDone _handle; };
    _client call compile preProcessFileLineNumbers "Core\init.sqf";
    _client setVariable ["INF_ClientReady",true,true];

    waitUntil {_client getVariable ["INF_ClientReady",false]};
    "SETUP" cutText ["Setup Complete","BLACK IN",2,false];
} else {
    _client call compile preProcessFileLineNumbers "Core\init.sqf";
    _client setVariable ["INF_ClientReady",true,true];   
};
