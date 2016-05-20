_pos = getMarkerPos "camera";
_tmpPos = getPosATL player;
_pos = [_tmpPos select 0, _tmpPos select 1,(_tmpPos select 2)+15];
_cam = "camera" camCreate _pos;
_cam camPrepareTarget player;
_cam camCommitPrepared 0;
_cam cameraEffect ["INTERNAL", "BACK", "myrender"];
"myrender" setPIPEffect[2];
player addAction ["show PIP",{
    
    cutRsc ["ExampleTitle","PLAIN"];
    
    }];
