params ["_client"];

diag_log "****************************************";
diag_log "Infection Client - Setting Up Client";
_client call compile PreprocessFileLineNumbers "core\configuration.sqf";


(findDisplay 46) displayAddEventHandler ["KeyDown", {_this call INF_fnc_keyDown;}];
(findDisplay 46) displayAddEventHandler ["KeyUp", {_this call INF_fnc_keyUpHandler;}];
(findDisplay 46) displayAddEventHandler ["MouseButtonDown", {_this call INF_fnc_mouseDown;}];


addMusicEventHandler ["MusicStop",{[] call INF_fnc_playMusic}];
[] call INF_fnc_playMusic;

if (isPlayer _client) then {
    addMissionEventHandler ["EachFrame",{
        { 
            _x call INF_fnc_drawIcon;
        } forEach playableUnits;
}];
};

_client call INF_fnc_setupEVH;

diag_log "Infection Client - Setup Complete";
diag_log "****************************************";