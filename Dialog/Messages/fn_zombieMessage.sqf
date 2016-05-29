if (player getVariable ["INF_ClientReady",false]) then {
    terminate INF_CurrentMessage;
    _handle = [
        [
            ["Selecting new Zombie","<t align = 'center' shadow = '1' size = '1'>%1</t><br/>",5],
            ["Please Wait ...","<t align = 'center' shadow = '1' size = '0.7'>%1</t>",20]
        ], 0, safeZoneY + (.1 * (safeZoneY + safeZoneH))
    ] spawn BIS_fnc_typeText;
    INF_CurrentMessage = _handle;
};