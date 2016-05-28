params ["_id","_key","_shift","_ctrl","_alt"];

_handled = false;
switch (_key) do {
    /* Space */
    case 57: {
        player spawn INF_fnc_jump;
        _handled = true;
     };
    default { };
};

_handled