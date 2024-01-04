/// @description
Juice_Step();

//Get movement speed
moveX = inputX * moveSpeed;
moveY = inputY * moveSpeed;

//Boost 镐子攻击
moveX += round(boostX);
moveY += round(boostY);

boostX = lerp(boostX, 0, 0.1);
boostY = lerp(boostY, 0, 0.1);

//Collisions
if (collision(x + moveX, y)) {
	while (!collision(x + sign(moveX), y)){//检测玩家在下一个像素位置是否有碰撞
		x += sign(moveX);	
	}
	
	moveX = 0;
}

if (collision(x, y + moveY)) {
	while (!collision(x, y + sign(moveY))){//同上
		y += sign(moveY);
	}
	
	moveY = 0;
}


//Move instance
x += moveX;
y += moveY;

//Animation: Move
if(moveX != 0 or moveY != 0){//水平或垂直方向有位移
	sprite_index = spriteMove;//如果成立，更改NPC精灵图
}
//Animation: Idle
else{//不移动时
	sprite_index = spriteIdle;
}

//Direction
var _sign = sign(moveX);//NPC走向

if(_sign != 0){
	image_xscale = _sign;
}

//Animation speed
if (moveX != 0 && sign(moveX) != _sign){//判断玩家前进和后退,进行动画正放或倒放
	image_speed = -1;
}
else{
	image_speed = 1;
}

//Die 血条归零时死亡
if(hp <= 0){
	instance_destroy();
	global.score += 1;//加1分
}