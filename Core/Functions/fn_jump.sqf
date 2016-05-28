if (isTouchingGround player) then {
  
	_vel = velocity player;
	_dir = direction player;
	_speed = 1;
	player setVelocity [
		(_vel select 0) + (sin _dir * _speed), 
		(_vel select 1) + (cos _dir * _speed), 
		(_vel select 2) + 5
	];
    
};