params ["_player"];

_team = _player getVariable "INF_Team";

removeHeadgear _player;
removeGoggles _player;
removeVest _player;
removeBackpack _player;
removeUniform _player;
removeAllWeapons _player;
removeAllAssignedItems _player;

if (_team == "ZOMBIE") then {
        
        switch (playerSide) do {
                case west: { _player addUniform "U_B_GhillieSuit";};
                case east: { _player addUniform "U_O_GhillieSuit";};
                case independent: { _player addUniform "U_I_GhillieSuit";};
                case civilian: { };
                default { };
        };         
          
} else {
        
        switch (playerSide) do {
                case west: { _player addUniform "U_B_CombatUniform_mcam_tshirt";};
                case east: { _player addUniform "U_O_CombatUniform_ocamo";};
                case independent: { _player addUniform "U_BG_Guerilla1_1";};
                case civilian: { };
                default { };
        };     
        
};