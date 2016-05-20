params ["_unit"];
_light = "#lightpoint"createVehicleLocal(getPosATLVisual _unit);
_light setLightBrightness .30;
[_light,_unit] spawn {

_min = .015;
_max = .075;
_curr = _min;
_thresh = false;
    waitUntil { sleep .001;
    if (_thresh) then {
        _curr = _curr - .001;
        (_this select 0) setLightAmbient [0, _curr,0];
        if (_curr <= _min) then {
            _thresh = false;
        };
    } else {
        _curr = _curr + .001;
        (_this select 0) setLightAmbient [0, _curr,0];
        if (_curr >= _max) then {
            _thresh = true;
        };
    };
    !alive (_this select 1)};
};
_light setLightColor [0,0,0];
_light lightAttachObject [_unit,[0,0,0.25]];
_unit setVariable ["INF_ZombieLight",_light,false];