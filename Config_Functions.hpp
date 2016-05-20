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
            
            class setupGear {};
            class spawnPlayer {};
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
          
          class setupEVH {};
          class roundManager {};
        };
        
        class Functions {
           file="Server\Functions";
           
           class connectedPlayer {};
           class disconnectedPlayer {};
           class unitKilled {};  
            
        };
        
        class RoundManager {
            
            file="Server\RoundManager";
            
            class resetWorld {};
            class setupTeams {};
            class setupZone {};
            class startRound {};

        };
        
        class TeamManager {
            
            file="Server\TeamManager";
          
            class updateTeams {};
            class setTeam {};
        };
    
    
};