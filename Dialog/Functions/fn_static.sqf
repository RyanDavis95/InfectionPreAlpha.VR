params ["_client"];
_layerNoise = "BIS_fnc_endMission_noise" call bis_fnc_rscLayer;
_layerInterlacing = "BIS_fnc_endMission_interlacing" call bis_fnc_rscLayer;
_layerStatic = "BIS_fnc_endMission_static" call bis_fnc_rscLayer;
_layerEnd = "BIS_fnc_endMission_end" call bis_fnc_rscLayer;
{_x cuttext ["","plain"]} foreach [_layerNoise,_layerInterlacing,_layerStatic,_layerEnd]; //--- Clear existing effects

setacctime 1;
_layerStatic cutrsc ["RscStatic","plain"];

RscNoise_color = [1,1,1,0];
_layerNoise cutrsc ["RscNoise","black"];
_layerStatic cutrsc ["RscStatic","plain"];

sleep .5;

RscNoise_color = [1,1,1,1];
_layerInterlacing cutrsc ["RscInterlacing","plain"];


_handle = [
    [
        ["ARMA III: ","align = 'center' shadow = '1' size = '2.5' font='PuristaBold'"],
        ["INFECTION","align = 'center' shadow = '1' size = '2.5'","#ffff00"],
        ["","<br/>"],
        ["Welcome to the Fray...","align = 'center' shadow = '2' size = '1.5'"]
    ],-.2,1
] spawn BIS_fnc_typeText2;   

waitUntil { _client getVariable ["INF_ClientReady",false] &&  scriptDone _handle };

_layerInterlacing cutText ["","plain"];
_layerNoise cutText ["","plain"];
_layerStatic cutrsc ["RscStatic","plain"];

sleep 1;
_layerStatic cutText ["","plain"];