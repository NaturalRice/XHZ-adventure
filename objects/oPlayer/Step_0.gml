/// @description
Juice_Step();

//Get input buttons
var _right = keyboard_check(vk_right) or keyboard_check(ord("D"));//按键
var _left = keyboard_check(vk_left) or keyboard_check(ord("A"));
var _up = keyboard_check(vk_up) or keyboard_check(ord("W"));
var _down = keyboard_check(vk_down) or keyboard_check(ord("S"));

//input axis
var _inputX = _right - _left;//让实例移动
var _inputY = _down - _up;

//Get movement speed
moveX = _inputX * moveSpeed;
moveY = _inputY * moveSpeed;

//Boost will be added in NPCParent
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
	sprite_index = sPlayer_Move;//如果成立，更改玩家精灵图
}
//Animation: Idle
else{//不移动时
	sprite_index = sPlayer_Idle;
}

//Direction
var _signMouse = sign(mouse_x - x);//玩家朝向随着鼠标

if(_signMouse != 0){
	image_xscale = _signMouse;
}

//Animation speed
if (moveX != 0 && sign(moveX) != _signMouse){//判断玩家前进和后退,进行动画正放或倒放
	image_speed = -1;
}
else{
	image_speed = 1;
}

//Die 血条归零时死亡
if(hp <= 0){
	instance_destroy();	
	oController.alarm[0] = 60;
}


//射击CD
shootDelay --;
if shootDelay <= 0 shootDelay = 0;//延迟等于0时可以进行一次射击

//侦测敌人并加入列表
if collision_circle_list(x,y,detectRad,oEnemyParent,false,true,enemyList,true){
	if ammo == 0{//没子弹了就不切换动画
		//目标敌人清空
		targetEnemy = noone;
		//敌人列表清空
		ds_list_clear(enemyList);
	}else{
		//切换为攻击动画
		sprite_index = sPlayer_Move_Attack;
		//确定敌人目标
		targetEnemy = enemyList[|0];
		//发射子弹并设置子弹的目标
		if shootDelay <= 0 and ammo > 0{
			//射击音效
			//audio_play_sound(aPlayerShoot,1,false);
			ammo --;
			var _b = instance_create_depth(x + image_xscale*10,y,depth-1,myBullettype);
			_b.target = targetEnemy;
			shootDelay = shootDelayInit;
		}
	}
}else{//若没侦测到敌人
	//目标敌人清空
	targetEnemy = noone;
	//敌人列表清空
	ds_list_clear(enemyList);
	//切换为原动画
	if(moveX != 0 or moveY != 0){//水平或垂直方向有位移
		sprite_index = sPlayer_Move;//如果成立，更改玩家精灵图
	}
		//Animation: Idle
	else{//不移动时
		sprite_index = sPlayer_Idle;
	}
}