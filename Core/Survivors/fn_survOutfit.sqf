params ["_unit"];
private["_side"];

removeHeadgear _unit;
removeGoggles _unit;
removeVest _unit;
removeBackpack _unit;
removeUniform _unit;
removeAllWeapons _unit;
removeAllAssignedItems _unit;


_unit addUniform "U_B_CombatUniform_mcam_tshirt";
_unit addBackpack "B_TacticalPack_blk";
_unit addWeapon "arifle_MXC_F";
_unit addMagazine "30Rnd_65x39_caseless_mag";
_unit addMagazine "30Rnd_65x39_caseless_mag";
_unit addMagazine "30Rnd_65x39_caseless_mag";
_unit addMagazine "30Rnd_65x39_caseless_mag";