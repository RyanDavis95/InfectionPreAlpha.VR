#define false 0
#define true 1

class INF_Settings {
    
    /* Damage Settings */
    Headshots_Only = false;
    
    /* Enabled Abilities */
    Survivor_Mines = true;
    Survivor_Sprint = true;
    Survivor_Heal = true;
    
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