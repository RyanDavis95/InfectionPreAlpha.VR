params ["_client","_item"];

switch (_item) do {
    case "Land_Ammobox_rounds_F": { _client call INF_fnc_giveAmmo };
    case "Item_MediKit": { _client call INF_fnc_giveHealth };
    case "Endurance": { _client call INF_fnc_giveEndurance };
    case "DemoCharge_F": { _client call INF_fnc_giveMine };
    default { };
};