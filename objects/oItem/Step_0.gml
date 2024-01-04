/// @description 
Juice_Step();

//Collision with player
if(!collected && place_meeting(x, y, oPlayer)){//是否被收集&&和玩家有碰撞
	//Add to inventory 把物品添加1到玩家的库存中,库存已满时不再收集
	var _added = inv_add(type, 1);
	
	//Collected 已经收集此物品
	collected = _added;
	
	//Juice 物品被收集时，动画效果：垂直压扁上浮，逐渐消失
	if(_added) Juice_ApplyScaling(xscale, yscale, 0.5, 1.5);
}

//Collected: fade away 物品被收集后，渐隐消失
if(collected){
	image_alpha -= 0.05;//渐隐的效果
	y -= 0.5;//持续向上移动的效果
	
	//Destory 实例销毁
	if(image_alpha < 0.1){
		instance_destroy();
	}
}

//Gravity 掉落动画
if(z < 0){
	zspd += 0.5;
	z += zspd;
	
	//Ground collision
	if(z >= 0){
		z = 0;
		zspd = 0;
		
		Juice_ApplyScaling(1.4, 0.7, 1, 1);//物品成水平压扁的动画效果
	}
}