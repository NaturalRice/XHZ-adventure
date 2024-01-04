function pauseToggle(){//暂停触发器（跟放置木板有关）
	///@arg <chestID>
	if(is_array(oController.movingArray)){//Moving an array鼠标上移动物品时不能暂停游戏
		return;
	}

	with(oPlayer){//游戏暂停脚本
		if(placingMode){
			event_user(1);
		}
	}
	with(oController){
			//Pause
		if(!pause){
			pause = true;//暂停游戏
		
			//Deactivate instances 禁用所有实例，除了Ocontroller保持激活
			instance_deactivate_all(true);
		
			//Create surface 创造一个表面，填入分辨率
			pauseSurf = surface_create(RES.WIDTH, RES.HEIGHT);
		
			//Copy 应用程序表面复制到暂停表面
			surface_copy(pauseSurf, 0, 0, application_surface);
		
			//Chest UI木箱的库存界面
			if(argument_count > 0){
				chestID = argument[0];
				event_user(2);
			}
			//UI 用户暂停界面
			else{
				event_user(0);
			}
		}
		//Resume 解除暂停，游戏继续
		else{
			pause = false;
		
			//Activate instances 激活房间内所有实例
			instance_activate_all();
		
			//Remove surface 检查暂停表面是否存在
			if(surface_exists(pauseSurf)){
				surface_free(pauseSurf);
			}
		
			//UI 调用用户事件1，在界面上销毁
			event_user(1);
		}
	}
}


