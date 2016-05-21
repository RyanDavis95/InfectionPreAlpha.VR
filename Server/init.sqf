diag_log "Infection Server - Setting up Game Vars";
[] call compile preProcessFileLineNumbers "Server\configuration.sqf";
diag_log "Infection Server - Game Vars Initialized";

diag_log "Infection Server - Setup Event Handlers";
[] call INFS_fnc_setupEVH;
diag_log "Infection Server - Event Handlers Initialized";

diag_log "Infection Server - Initializing Round System";
[] spawn INFS_fnc_roundManager;
diag_log "Infection Server - Round System Initialized";