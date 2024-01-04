/// @description 
/// @description
//Roaming     敌人的AI
if(!following){//敌人未在跟踪玩家，玩家在其探测范围外
	moveSpeed = moveSpeedRoam;
	
	//Set roam position
	if(roamTime == 0){
		var _len = random(roamDistance);//漫游距离
		var _dir = random(360);//360度漫游
		
		targetX = xstart + lengthdir_x(_len, _dir);
		targetY = ystart + lengthdir_y(_len, _dir);
		
		roamTime = 120;
	}
	else roamTime --;
	
	//Set follow 玩家存在并在其探测范围内时开始追击
	if(instance_exists(oPlayer) && distance_to_object(oPlayer) < followDistance){
		following = true;
	}
}
//Following 慢慢靠近主人
else{
	moveSpeedFollow = 0.4;
	moveSpeed = moveSpeedFollow;
	
	//Set target
	if(instance_exists(oPlayer) && distance_to_object(oPlayer) < followDistance * 1.3){
		targetX = oPlayer.x;
		targetY = oPlayer.y;
	}
	//Set roaming
	else{
		following = false;
	}
}

//Move
if(point_distance(x, y, targetX, targetY)> moveSpeed){
	inputX = clamp(targetX - x, -1, 1);
	inputY = clamp(targetY - y, -1, 1);
}
//Stop
else{
	inputX = 0;
	inputY = 0;
}