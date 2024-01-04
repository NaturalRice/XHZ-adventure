///@desc Getting attacked 被攻击后
///@arg attacker
function getAttacked(){
	if(oEnemy4.ammo == 0 and distance_to_object(oEnemy4) < 15){//再靠近一点就会融化
		instance_create_depth(x,y,depth,oPlayerDead1);
		hp = hp -5;
	}else{
		//Args
		var _attacker = argument[0];
	
		//HP
		hp --;
	
		//Knockbackddssd
		var _dir = point_direction(_attacker.x, _attacker.y, x, y);
			
		boostX = lengthdir_x(knockbackSpeed, _dir);
		boostY = lengthdir_y(knockbackSpeed, _dir);
	
		//Juice 被玩家攻击后闪光
		Juice_ApplyScaling(0.5, 1.5, 1, 1);
	
		if(_attacker == oPlayer)//判断是玩家攻击敌人，发出白色闪光
			Juice_ApplyFlash(c_white, 1);
		else
			Juice_ApplyFlash(c_red, 1);//被敌人攻击时发出红色闪光
	}
}