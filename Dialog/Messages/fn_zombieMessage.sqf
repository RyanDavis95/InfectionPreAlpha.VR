_handle = [
    [
        ["Selecting ","align = 'center' shadow = '1' size = '1.0'","#e1e1e1"],
        ["Alpha ","align = 'center' shadow = '1' size = '1'","#ff3300"],
        ["Zombie","align = 'center' shadow = '1' size = '1.0'","#e1e1e1"],
        ["","<br/>"],
        ["Please Wait...","align = 'center' shadow = '2' size = '.8'"]
    ],0,0
] spawn INFD_fnc_displayText;
waitUntil { scriptDone _handle; };