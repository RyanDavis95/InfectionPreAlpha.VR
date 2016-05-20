diag_log "****************************************";
diag_log "Infection Client - Setting Up Client";
[] call compile PreprocessFileLineNumbers "core\configuration.sqf";


(findDisplay 46) displayAddEventHandler ["KeyDown", {_this call INF_fnc_keyDown;}];
//(findDisplay 46) displayAddEventHandler ["KeyUp", {_this call INF_fnc_keyUpHandler;}];
(findDisplay 46) displayAddEventHandler ["MouseButtonDown", {_this call INF_fnc_mouseDown; true;}];


addMusicEventHandler ["MusicStop",{[] call INF_fnc_playMusic}];
[] call INF_fnc_playMusic;

diag_log "Infection Client - Setup Complete";
diag_log "****************************************";
INF_ClientInitialized = true;