player addAction ["Show Teams",{
        player globalChat format ["Survivors: %1",count INFS_Survivors];
        player globalChat format ["Zombies: %1", count INFS_Zombies];   
}];
