if (player getVariable "INF_ClientReady") then {
    terminate INF_CurrentMessage;
    _handle = [
        [
            ["All survivors have been eliminated","<t align = 'center' shadow = '1' size = '1'>%1</t><br/>",5],
            ["Starting new round...","<t align = 'center' shadow = '1' size = '0.7'>%1</t>",15]
        ], 0, safeZoneY + (.1 * (safeZoneY + safeZoneH))
    ] spawn BIS_fnc_typeText;
    INF_CurrentMessage = _handle;
};
