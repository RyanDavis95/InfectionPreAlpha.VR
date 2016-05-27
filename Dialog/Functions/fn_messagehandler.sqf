while {true} do {
    waitUntil { !(INF_MessageQueue isEqualTo []) };
    _message = INF_MessageQueue select 0;
    switch (_message) do {
        case "WELCOME": {
            _handle = [] spawn INFD_fnc_welcomeMessage;
            //waitUntil { scriptDone _handle; };
            INF_MessageQueue = INF_MessageQueue - [_message];
        };
        case "ZOMBIE": {
            _handle = [] spawn INFD_fnc_zombieMessage;
            waitUntil { scriptDone _handle; };
            INF_MessageQueue = INF_MessageQueue - [_message];
        };
        default { };
    };
    //sleep 5;
};