params ["_client"];

_team = _client getVariable "INF_Team";

removeHeadgear _client;
removeGoggles _client;
removeVest _client;
removeBackpack _client;
removeUniform _client;
removeAllWeapons _client;
removeAllAssignedItems _client;

if (_team == "ZOMBIE") then {
        
        switch (playerSide) do {
                case west: {_client adduniform "U_B_GhillieSuit";};
                case east: { _client addUniform "U_O_GhillieSuit";};
                case independent: { _client addUniform "U_I_GhillieSuit";};
                case civilian: { };
                default { };
        };         
          
} else {
        
        switch (playerSide) do {
                case west: { _client adduniform "U_B_CombatUniform_mcam_tshirt";};
                case east: { _client addUniform "U_O_CombatUniform_ocamo";};
                case independent: { _client addUniform "U_BG_Guerilla1_1";};
                case civilian: { };
                default { };
        };     
        
};