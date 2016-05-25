params ["_client"];

{_client reveal _x} forEach allUnits;
if !(_client getVariable "INF_zomAttack") then {
    
    _client setVariable ["INF_zomAttack",true,true];
    _client switchMove "AwopPercMstpSgthWnonDnon_throw";
    
    if (((cursorTarget getVariable ["INF_Team","UNASSIGNED"]) == "SURVIVOR") && _client distance cursorTarget <= 1) then { 
                 
            cursorTarget setDamage 1; 
    };

    waitUntil { animationState _client != "AwopPercMstpSgthWnonDnon_throw"; };
    _client playMove "";
     
    sleep .25;
    _client setVariable ["INF_zomAttack",true,true];
};