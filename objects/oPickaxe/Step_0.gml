/// @description 
rotation = lerp(rotation, 45, 0.1);//插值函数：无论之前角度多少，都会回到45度

image_angle = rotation * oPlayer.image_xscale;//控制实例旋转

//Get input
var _mousePress = mouse_check_button(mb_left);//检测鼠标左键点击事件


//Get breakable instance at mouse position
var _breakable = instance_position(mouse_x, mouse_y, oBreakableParent);

with(_breakable){//实例内部运行
	//Get distance 获取实例与玩家实例的距离
	var _dist = distance_to_object(oPlayer);
	
	//In range? 是否小于可破坏对象距离
	if(_dist < other.breakDistance){
		//Set selected
		other.selectorInst = id;
		
		//Click 冷却CD是否等于0 && 鼠标是否按下
		if(other.cooldown == 0 && _mousePress){
			//Reduce hp 破坏对象生命值减去
			hp--;
			
			//Set rotation 自身角度到-80
			other.rotation = -80;
			
			//Set cooldown CD到20
			other.cooldown = 20;
			
			//Juice 果汁动画效果：垂直压扁，X轴缩减，Y轴拉长，后慢慢回到1
			Juice_ApplyScaling(0.7, 1.3, 1, 1);
			Juice_ApplyFlash(c_white, 1);//闪光
		}
	}
}

//Get enemy instance at mouse position
var _enemy = instance_position(mouse_x, mouse_y, oEnemyParent);

with(_enemy){//实例内部运行
	//Get distance 获取实例与敌人实例的距离
	var _dist = distance_to_object(oPlayer);
	
	//In range? 是否小于攻击距离
	if(_dist < other.attackDistance){
		//Set selected
		other.selectorInst = id;
		
		//Click 冷却CD是否等于0 && 鼠标是否按下
		if(other.cooldown == 0 && _mousePress){
			//Set rotation 自身角度到-80
			other.rotation = -80;
			
			//Set cooldown CD到20
			other.cooldown = 20;
			
			//Attack 攻击
			getAttacked(oPlayer);			
		}
	}
}

//Cooldown
if(cooldown > 0) cooldown--;