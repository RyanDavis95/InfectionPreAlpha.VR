class Infection_Core {

    tag="INF";
        
        class Core {
            file="Core";
            
            class initSurvivor {};
            class initZombie {};
            class setupEVH {};
            
        };
        
        class Functions {
            file="Core\Functions";

            class bloodEffects {};
            class getObjHeight {};          
            class jump {};
            class keyDown {};
            class mouseDown {};
            class playMusic {};
            class setupGear {};
            class spawnPlayer {};
            
        };
        
        class {
            file="Core\Stats";
            
            class incStat {};
            class updateStats {};
        };
        
        class Survivors {
            file="Core\Survivors";
            
            class HandleSurvDamage {};
            
        };
        
        class Zombies {
            file="Core\Zombies";
            
            class glowEffects {};
            class zombieDmg {};
            class zombieAttack {};
        };
        
};

class Infection_Dialog {
    tag="INFD";
        class Functions {
          file="Dialog\Functions";
          
          class drawIcon {};
          class handleIcons {}; 
          class iconColor {};
          class static {};
          
        };
        
        class Messages {
          file="Dialog\Messages";
          
          class survivorsEliminated {};
          class welcomeScreen {};
          class zombieMessage {};   
          class playerInfected {}; 
           
        };
        class Icons {
          file="Dialog\Icons";
          
          class deadIcon {};
          class engagedIcon {};
          class killIcon {};
          class movingIcon {};
             
        };
};

class Infection_Server {
    
    tag="INFS";
        
        class Server {
          
          file="Server";
          
          class roundManager {};
          class setupEVH {preInit=1;};
          
        };
        
        class Functions {
           file="Server\Functions";
           
        };
        
        class Items {
            file="Server\Items";
            
            class dropItem {};
            class giveAmmo {};
            class giveEndurance {};
            class giveHealth {};
            class giveMine {};
            class itemPickup {};  
            
        };
        
        class PlayerManager {
            file="Server\PlayerManager";
            
            class connectedPlayer {};
            class disconnectedPlayer {};
            class setupPlayer {};
            class unitKilled {};  
            class unitRespawned {};
            class updateTeams {};
            class savePlayerStats {};
            
        };
        
        class RoundManager {
            
            file="Server\RoundManager";
            
            class pickAlpha {};
            class resetWorld {};
            class setupZone {};
            class startIntermission {};
            class startRound {};
            class waitForEnd {};
            class waitForPlayers {};

        };
        
        class ScoreManager {
            
            file="Server\Stats";
                   
        };      
};