params ["_client"];
private ["_itemType"];

_itemType = INFS_ItemDrops call BIS_fnc_selectRandom;

_item = createVehicle [_itemType,[
        (getPos _client) select 0,(getPos _client) select 1, ((getPos _client) select 2) + .25], 
        [], 
        0, 
        "CAN_COLLIDE"
];
_item setVariable ["INF_objDir", getDir _item, true];

INFS_SpawnedStructures pushBack _item;

_item spawn {
    waitUntil {  _list = (getPos _item) nearEntities ["MAN",1];
        _found = false;
        _this setDir ((_this getVariable ["INF_objDir",0]) + .001);
        _this setVariable ["INF_objDir",getDir _this,true];
        
        if (count _list > 0) then {
            _dist = 100000;
            _closest = objNull;
            {
                if((_x getVariable "INF_Team") == "SURVIVOR" && (_x distance _this < _dist)) then {
                    _dist = _x distance _this;
                    _closest = _x;
                };
            } forEach _list;
            [_closest,_itemType] call INF_fnc_itemPickup;
            deleteVehicle _this;
            INFS_SpawnedStructures = INFS_SpawnedStructures - _item;
            _found = true
        };
        _found
    };
};