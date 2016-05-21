params ["_player"];

_team = _player getVariable "INF_Team";

removeHeadgear _player;
removeGoggles _player;
removeVest _player;
removeBackpack _player;
removeUniform _player;
removeAllWeapons _player;
removeAllAssignedItems _player;
_player adduniform "U_B_Protagonist_VR";

if (_team == "ZOMBIE") then {
        
        switch (playerSide) do {
                case west: { _player setObjectTextureGlobal [0,'#(rgb,8,8,3)color(0,1,0,1)'];};
                case east: { _player addUniform "U_O_GhillieSuit";};
                case independent: { _player addUniform "U_I_GhillieSuit";};
                case civilian: { };
                default { };
        };         
          
} else {
        
        switch (playerSide) do {
                case west: { _player setObjectTextureGlobal [0,'#(rgb,8,8,3)color(0,1,1,1)'];};
                case east: { _player addUniform "U_O_CombatUniform_ocamo";};
                case independent: { _player addUniform "U_BG_Guerilla1_1";};
                case civilian: { };
                default { };
        };     
        
};