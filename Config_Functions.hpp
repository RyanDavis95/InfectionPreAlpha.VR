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
            class jump {};
            class keyDown {};
            class mouseDown {};
            class playMusic {};
            class setupGear {};
            class spawnPlayer {};
            class updateStats {};
            class zoneSpawn {};
            
        };
        
        class Survivors {
            file="Core\Survivors";  
            
            class HandleSurvDamage {};
            
        };
        
        class Zombies {
            file="Core\Zombies";
            
            class glowEffects {};
            class HandleZomDamage {};
            class removeGlow {};
            class zombieAttack {};
        };
        
};

class Infection_Dialog {
    tag="INFD";
        class Dialog {
          file="Dialog";
          
          class drawIcon;
          class fadeColor;
          class handleIcons;          
        };
};

class Infection_Server {
    
    tag="INFS";
        
        class Server {
          
          file="Server";
          
          class roundManager {};
          class setupEVH {};
          
        };
        
        class Functions {
           file="Server\Functions";
           
           class connectedPlayer {};
           class disconnectedPlayer {};
           class pickAlpha {};
           class setTeam {};
           class unitKilled {};  
           class updateTeams {};
           
        };
        
        class Items {
            file="Server\Items";
            
            class dropItem {};
            class itemPickup {};  
            
        };
        
        class RoundManager {
            
            file="Server\RoundManager";
            
            class getPlayers {};
            class resetWorld {};
            class setupStats {};
            class setupTeams {};
            class setupZone {};
            class startIntermission {};
            class startRound {};

        };
        
        class ScoreManager {
            
            file="Server\ScoreManager";
            
            class initScoreVars {};
            class savePlayerStats {};
            class updateStat {};  
                   
        };      
};