if (isTouchingGround player && !(player getVariable ["INF_Client_Jumping",false])) then {
	player setVariable ["INF_Client_Jumping",true,true];
	_vel = velocity player;
	_dir = direction player;
	_speed = 1;
	player setVelocity [
		(_vel select 0) + (sin _dir * _speed), 
		(_vel select 1) + (cos _dir * _speed), 
		(_vel select 2) + 5
	];
    sleep 1.5;
	player setVariable ["INF_Client_Jumping",false,true];
};