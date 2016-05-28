terminate INF_CurrentMessage;
_handle = [
	[
		["Selecting ","<t align = 'center' shadow = '1' size = '1'>%1</t>",5],
		["ZOMBIE","<t align = 'center' size = '1' color = '#ffffff' >%1</t><br/>",5],
		["Please Wait ...","<t align = 'center' shadow = '1' size = '0.7'>%1</t>",15]
	], 0, safeZoneY + (.1 * (safeZoneY + safeZoneH))
] spawn BIS_fnc_typeText;
INF_CurrentMessage = _handle;