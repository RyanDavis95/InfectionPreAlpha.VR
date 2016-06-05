params ["_client"];
private ["_itemType"];

_dropped = _client getVariable ["INF_Client_ItemDropped",true];
_itemType = selectRandom INFS_Settings_ItemDrops;

if (!_dropped) then {
    _client setVariable ["INF_Client_ItemDropped",true];
    _item = createVehicle [_itemType,[
            (getPos _client) select 0,(getPos _client) select 1, ((getPos _client) select 2) + .5], 
            [], 
            0, 
            "CAN_COLLIDE"
    ];
    _item setVariable ["INF_Drops_Dir", getDir _item, true];

    INFS_Lists_Drops pushBack _item;

    [_item,_itemType] spawn {
        _item = _this select 0;
        _itemPos = getPos _item;
        _itemType = _this select 1;
        waitUntil {  _list = (getPos _item) nearEntities ["MAN",1];
            _found = false;
            _item setPos _itemPos; // Keep hovering
            _item setDir ((_item getVariable ["INF_Drops_Dir",0]) + .2);
            _item setVariable ["INF_Drops_Dir",getDir _item,true];
            
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
                INFS_Lists_Drops = INFS_Lists_Drops - [_item];
                _found = true
            };
            _found
        };
    };
};