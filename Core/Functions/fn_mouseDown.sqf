params ["_id","_mouse","_shift","_ctrl","_alt"];

_handled = false;
switch (_mouse) do {
    
    /* Right Click */
    case 0: {
        if (player getVariable "INF_Team" == "ZOMBIE") then {
            player spawn INF_fnc_zombieAttack;
            _handled = true;
        };
     };
    default { };
};

_handled