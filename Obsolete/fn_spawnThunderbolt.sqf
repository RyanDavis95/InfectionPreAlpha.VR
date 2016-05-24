params ["_unit"];
_target = _unit call INF_fnc_nearestUnit;
_pos = [ position _target select 0,position _target select 1, (position _target select 2) + 1];
//_target allowDamage false;
_bolt = createvehicle ["LightningBolt",_pos,[],0,"can collide"];
_bolt setposatl _pos;
_bolt setdamage 1;

        
_light = "#lightpoint" createvehiclelocal _pos;
_light setposatl [_pos select 0,_pos select 1,_pos select 2];
_light setLightDayLight true;
_light setLightBrightness 300;
_light setLightAmbient [0.05, 0.05, 0.1];
_light setlightcolor [1, 1, 2];

sleep 0.1;
_light setLightBrightness 0;
sleep (random 0.1);

_class = ["lightning1_F","lightning2_F"] call bis_Fnc_selectrandom;
_lightning = _class createvehiclelocal [100,100,100];
_lightning setdir (random 360);
_lightning setpos _pos;      

for "_i" from 0 to 1 do {
    _light setLightBrightness (100 + random 100);
};
    
//Random thunder sample
private "_thunder";
_thunder = ["thunder_1", "thunder_2"] call BIS_fnc_selectRandom;

//Play thunder sound
playSound _thunder; 
deletevehicle _lightning;
deletevehicle _light;
{
    if(_target distance _x < 3 && _x != _target) then {_x setDammage ((getDammage _x) + (random .75));};
    
} forEach playableUnits;

_target setDammage 1;