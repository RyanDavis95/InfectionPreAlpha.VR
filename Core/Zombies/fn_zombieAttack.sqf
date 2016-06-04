params ["_client"];

{_client reveal _x} forEach allUnits;
if !(_client getVariable ["INF_ZombieAttacking",false]) then {
    
    _client setVariable ["INF_ZombieAttacking",true,true];
    _client switchMove "AwopPercMstpSgthWnonDnon_throw";
    
    _victims = (getPos player) nearEntities ["MAN",2];
    
    if (count _victims > 0) then {
        _survivors = [];
        {
            if (_x getVariable "INF_Client_Team" == "SURVIVOR") then {
                _survivors pushBack _x;
            };
        } forEach _victims;
        if (count _survivors > 0) then {
            _victim = _survivors select 0;
            _currDmg = getDammage _victim;
            _victim setDammage (1/2 + _currDmg);
        };
        
    };    


    waitUntil { animationState _client != "AwopPercMstpSgthWnonDnon_throw"; };
    _client playMove "";
     
    sleep .75;
    _client setVariable ["INF_ZombieAttacking",false,true];
};