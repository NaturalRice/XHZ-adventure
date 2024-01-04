/// @description 
event_inherited();

//射击CD
shootDelay --;
if shootDelay <= 0 shootDelay = 0;//延迟等于0时可以进行一次射击

//侦测玩家并加入列表
if collision_circle_list(x,y,detectRad,oPlayer,false,true,enemyList,true){
	
	if(instance_exists(oPlayer) && distance_to_object(oPlayer) < 30){
		//切换为近战动画
		sprite_index = sEnemy4Near;		
	}else{
		//切换为远程攻击动画
		sprite_index = sEnemy4Move;
	}

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
	//两种弹药，篮球没了就下蛋
	if shootDelay <= 0 and ammo == 0 and ammo2 > 0{
		//射击音效
		//audio_play_sound(aPlayerShoot,1,false);
		ammo2 --;
		var _b = instance_create_depth(x + image_xscale*10,y,depth-1,myBullettype2);
		_b.target = targetEnemy;
		shootDelay = shootDelayInit;	
	}		
}else{//若没侦测到玩家
	//目标敌人清空
	targetEnemy = noone;
	//敌人列表清空
	ds_list_clear(enemyList);
	//切换为原动画
	sprite_index = sEnemy4;
}

//Die 血条归零时死亡
if(hp <= 0){
	instance_create_depth(x,y,depth,oEnemy4Dead);//播放死亡动画
	instance_destroy();
	global.score += 99;//加99分，合计100分
}