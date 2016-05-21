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
            
            class handleKills {};
            class jump {};
            class keyDown {};
            class mouseDown {};
            class playMusic {};
            class setupGear {};
            class spawnPlayer {};
            class setTeam {};
        };
        
        class Survivors {
            file="Core\Survivors";  
            
            class HandleSurvDamage {};
            class survConfig {};
            class zoneSpawn {};
        };
        
        class Zombies {
            file="Core\Zombies";
            
            class bloodEffects {};
            class glowEffects {};
            class HandleZomDamage {};
            class removeGlow {};
            class zombieSpawn {};       
            class zomConfig {};
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
           class unitKilled {};  
           class updateTeams {};
        };
        
        class RoundManager {
            
            file="Server\RoundManager";
            
            class resetWorld {};
            class setupStats {};
            class setupTeams {};
            class setupZone {};
            class startRound {};

        };
        
        class ScoreManager {
            
            file="Server\ScoreManager";
            
            class initScoreVars {};
            class savePlayerStats {};
            class updateStat {};  
                   
        };
       
};