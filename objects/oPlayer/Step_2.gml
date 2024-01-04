/// @description 
//Move held item
if(instance_exists(heldItem)){
	heldItem.x = x - 3 * image_xscale;//保证玩家和持有物都在正确方向
	heldItem.y = y + 3;
}

//Placing mode放置模式
if(placingMode && instance_exists(placingInst)){
	var _colliding = false;
	
	//Move instance
	with(placingInst){
		x = round(mouse_x / PLACING_GRID_SIZE) *PLACING_GRID_SIZE;//放置大小为16的倍数或0
		y = round(mouse_y / PLACING_GRID_SIZE) *PLACING_GRID_SIZE;
		
		//Collision
		_colliding = collision(x, y) || collision_entity(x, y);
	}
	
	//Colliding
	if(_colliding) placingInst.image_blend = c_red;//有障碍物不可放置，显示红色
	else placingInst.image_blend = c_white;//有空位可放置，显示白色
	
	//Place
	if(!_colliding && mouse_check_button_pressed(mb_left)){
		event_user(1);
	}
}

//Open chest 打开木箱
var _chest = collision_circle(x, y, 12, oChestParent, false, false);

if(instance_exists(_chest)){
	//Show E key 按键
	showkey = sButtonE;
	
	//Open chest
	if(keyboard_check_pressed(ord("E"))){
		pauseToggle(_chest);
	}
}
