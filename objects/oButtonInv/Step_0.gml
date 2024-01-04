/// @description 
//Use
if(hover && lclick){
	//Get array
	var _arr = oController.invList[| slotID];
	
	if(is_array(_arr)){
		//Vars
		var _item = _arr[0];
		var _count = _arr[1];
		
		var _used = false;//whether we use the item
		
		//Effect
		instance_activate_object(oPlayer);
		
		switch(_item){//喝药水恢复1点生命值
			case ITEM.POTION:
				with(oPlayer){
					if(hp < hpMax){
						hp ++;
						_used = true;
						
						if(hp > hpMax)hp = hpMax;
					}
				}
			break;
			
			case ITEM.SYRUP://喝果汁恢复1.5点生命值
				with(oPlayer){
					if(hp < hpMax){
						hp += 1.5;
						_used = true;
						
						if(hp > hpMax)hp = hpMax;
					}
				}
			break;
			
			case ITEM.APOTION://喝加速药水增加移动速度
				with(oPlayer){
					if(moveSpeed < moveSpeedMax){
						moveSpeed += 0.5;
						_used = true;

						if(moveSpeed > moveSpeedMax)moveSpeed = moveSpeedMax;
						
					}
					oController.alarm[1] = 600;//药效时间
				}
			break;
			
			case ITEM.AMMO://补充弹药
				with(oPlayer){					
					ammo += 1;
					_used = true;					
				}
			break;
			
			case ITEM.APPLE://吃苹果恢复0.5点生命值
				with(oPlayer){
					if(hp < hpMax){
						hp += 0.5;
						_used = true;
					}
				}
			break;
			//以下物品设置为可放置！！！
			default:
				if(global.itemPlaceable[_item] != noone){
					pauseToggle();//暂停触发器
				
					with(oPlayer){
						placingObj = global.itemPlaceable[_item];//物品放置
					
						event_user(0);
					}
				
					_used = true;
				}
			break;
		}
		
		if(oController.pause) instance_deactivate_object(oPlayer);
		
		//Used 血条满时不能用药水
		if(_used){
			//Reduce count
			_arr[@ 1] --;
			
			//Check if empty
			event_user(0);
			
			show_debug_message("The item was used");
		}
		else{
			show_debug_message("The item couldn＇t be used");
		}	
	}
}
//Remove 从物品栏中移除
if (hover && rclick) {
	//Get array
	var _arr = oController.invList[| slotID];
	
	if(is_array(_arr)){
		//Re-activate player
		instance_activate_object(oPlayer);
		
		//Drop items 丢弃物品
		var _item = _arr[0];
		var _count = _arr[1];
		
		repeat(_count){
			//Item position
			var _x = oPlayer.x + irandom_range(12, 20);
			var _y = oPlayer.y + irandom_range(12, 20);
			
			//Create oItem
			var _inst = instance_create_layer(_x, _y, "Instances", oItem);
			
			//Set item properties
			with(_inst){
				type = _item;
				
				sprite_index = global.itemSprite[_item];
				
				z = -20;
			}
		}
		
		//Deactivate player & items
		instance_deactivate_object(oPlayer);
		instance_deactivate_object(oItem);
		
		//Remove
		inv_remove(slotID);
	}
}