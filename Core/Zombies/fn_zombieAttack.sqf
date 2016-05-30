params ["_client"];

{_client reveal _x} forEach allUnits;
if !(_client getVariable "INF_ZombieAttacking") then {
    
    _client setVariable ["INF_ZombieAttacking",true,true];
    _client switchMove "AwopPercMstpSgthWnonDnon_throw";
    
    if (((cursorTarget getVariable ["INF_Team","UNASSIGNED"]) == "SURVIVOR") && _client distance cursorTarget <= 1) then {   
            _victim = cursorTarget;
            sleep .75;
            _currDmg = getDammage _victim;
            _victim setDammage ((random INF_Settings_ZombieAttackDamage) + _currDmg);
    };

    waitUntil { animationState _client != "AwopPercMstpSgthWnonDnon_throw"; };
    _client playMove "";
     
    sleep .5;
    _client setVariable ["INF_ZombieAttacking",false,true];
};