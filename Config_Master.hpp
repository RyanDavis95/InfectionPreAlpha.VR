#define false 0
#define true 1
#define Minute 60;

class INF_Settings {
    
    /* Damage Settings */
    Headshots_Only = false;
    IntermissionTime = 5;
    MaxRoundTime = 300;
    IconRefreshRate = 5;
    IconFadeTime = 5;
    minPlayers = 2;
    
    /* Enabled Abilities */
    Survivor_Mines = true;
    Survivor_Sprint = true;
    Survivor_Heal = true;
    Survivor_Speed = 1;
    
    DefaultIconColor[] = {0,1,1};
    EngagedIconColor[] = {1,1,0};
    KilledIconColor[] = {1,0,0};
    
    
    /* Stats */
    KillXP = 100;
    AssistXP = 25;
    HeadshotXP = 50;
    
    /* Zombies */
    Zombie_Speed = 1.2;
    Zombie_AttackDamage = .5;
    
    playerStats[] = {
        "INF_Stats_Kills",
        "INF_Stats_Assists",
        "INF_Stats_Headshots",
        "INF_Stats_XP",
        "INF_Stats_Deaths"
        };
    
    /* Droppable Items */
    itemDrops[] = {
        "Land_Ammobox_rounds_F",
        "Weapon_srifle_dmr_01_F",
        "DemoCharge_F",
        "Item_MediKit"  
    };
    
    
    ranks[] = {
        {"Private"},
        {"Corporal"},
        {"Sergeant"},
        {"Staff Sergeant"},
        {"Technical Sergeant"},
        {"First Sergeant"},
        {"Master Sergeant"},
        {"Second Lieutenant"},
        {"First Lieutenant"},
        {"Captain"},
        {"Major"},
        {"Lieutenant Colonel"},
        {"Colonel"},
        {"Brigadier General"},
        {"Major General"},
        {"Lieutenant General"},
        {"General"},
        {"General of the Army"}
    };
    
    survivorAbilities[] = {
        {"Sprint",10},
        {"LayMine",1},
        {"Heal",5},
        {"UAV",5}
    };
    
    zombieAbilities[] = {
        {"Shock",30},
        {"Poison",15},
        {"Jump",10},
        {"Sense",10}          
    };
    
    perkPositions[] = {
      {,},
      {,},
      {,},
      {,}
    };
};