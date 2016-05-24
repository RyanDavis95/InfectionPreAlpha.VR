params ["_client"];

_ammo = createVehicle ["Land_Ammobox_rounds_F",[
        (getPos _client) select 0,(getPos _client) select 1, (getPos _client) select 2], 
        markers, 
        placement, 
        special
];

_ammo spawn {
    waitUntil {  _list = (getPos _ammo) nearEntities ["MAN",1];
        if (count _list > 0) then {
            _dist = 100000;
            {
                if((_x getVariable "INF_Team") == "SURVIVOR") then {};
            } forEach _list;
        };
        (getPos _ammo) nearEntities ["MAN",1]};
};