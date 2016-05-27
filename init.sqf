{
    sleep 1;
    [parseText format ["<t size='1.5' color='#ffffff' align='left'>%1</t><t size='1.5' color='#fa3200' align='right'>%2</t>
                    <br /><t size='1.5' color='#e6e6e6' align='left'>%3</t><t size='1.5' color='#fa3200' align='right'>%4</t>"
                    ,"Killed Zombie: ","+" + str _x,"Headshot: ","+50"],[safeZoneX + .1,safeZoneY+safeZoneH - .3,.5,.2],[10,8],5,.5,0] spawn BIS_fnc_textTiles;
    
} forEach [100,200,300,400,500];