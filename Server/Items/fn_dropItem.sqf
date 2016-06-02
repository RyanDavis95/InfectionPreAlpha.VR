params ["_client"];
private ["_itemType"];

_dropped = _client getVariable ["INF_ItemDropped",true];
_itemType = INFS_ItemDrops call BIS_fnc_selectRandom;

if (!_dropped) then {
    _client setVariable ["INF_ItemDropped",true];
    _item = createVehicle [_itemType,[
            (getPos _client) select 0,(getPos _client) select 1, ((getPos _client) select 2) + .5], 
            [], 
            0, 
            "CAN_COLLIDE"
    ];
    _item setVariable ["INF_objDir", getDir _item, true];

    INFS_SpawnedStructures pushBack _item;

    [_item,_itemType] spawn {
        _item = _this select 0;
        _itemPos = getPos _item;
        _itemType = _this select 1;
        waitUntil {  _list = (getPos _item) nearEntities ["MAN",1];
            _found = false;
            _item setPos _itemPos; // Keep hovering
            _item setDir ((_item getVariable ["INF_objDir",0]) + .2);
            _item setVariable ["INF_objDir",getDir _item,true];
            
            if (count _list > 0) then {
                _dist = 100000;
                _closest = objNull;
                {
                    if((_x getVariable "INF_Client_Team") == "SURVIVOR" && (_x distance _item < _dist)) then {
                        _dist = _x distance _item;
                        _closest = _x;
                    };
                } forEach _list;
                [_closest,_itemType] call INFS_fnc_itemPickup;
                deleteVehicle _item;
                INFS_SpawnedStructures = INFS_SpawnedStructures - [_item];
                _found = true
            };
            _found
        };
    };
};