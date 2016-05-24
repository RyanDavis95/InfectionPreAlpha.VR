params ["_client","_item"];

switch (_item) do {
    case "Ammo": { _client call INF_fnc_giveAmmo };
    case "Health": { _client call INF_fnc_giveHealth };
    case "Endurance": { _client call INF_fnc_giveEndurance };
    case "Mine": { _client call INF_fnc_giveMine };
    default { };
};