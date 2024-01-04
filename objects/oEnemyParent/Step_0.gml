/// @description 

// Inherit the parent event
event_inherited();

//Attack player 攻击玩家
if(collision_circle(x, y, attackRadius, oPlayer, false, false) && attackCooldown == 0){
	with(oPlayer){
		getAttacked(other);
	}
	
	attackCooldown = 20;//攻击CD
}

//Attack cooldown
if(attackCooldown > 0) attackCooldown --;