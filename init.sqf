player addAction ["View Stats",
    {
        hint format["Kills: %1\nDeaths: %2\nXP: %3:",
            profileNamespace getVariable "PlayerKills",
            profileNamespace getVariable "PlayerDeaths",
            profileNamespace getVariable "PlayerXP"]
    }
];