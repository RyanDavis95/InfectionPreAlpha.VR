terminate INF_CurrentMessage;
_handle = [
    [
        ["ARMA III: ","align = 'center' shadow = '1' size = '2.5' font='PuristaBold'"],
        ["INFECTION","align = 'center' shadow = '1' size = '2.5'","#ffff00"],
        ["","<br/>"],
        ["Welcome to the Fray...","align = 'center' shadow = '2' size = '1.5'"]
    ],-.2,1
] spawn BIS_fnc_typeText2;
waitUntil { scriptDone _handle; };