/// @description 
#region Pause
//Press Escape 是否按下Esc键
if(keyboard_check_pressed(vk_escape)){
	pauseToggle();
}
#endregion

//Paused 仅在游戏暂停时执行
if(pause){
	//Crafting menu scrolling 创造菜单滚动
	var _wheel = mouse_wheel_up() - mouse_wheel_down();//获取鼠标滚轮的输入
	_wheel *= 8;//滚动速度
	
	cMenuScorll += _wheel;//赋值
	
	//Limit滚动范围限制
	cMenuScorll = clamp(cMenuScorll, -cMenuHeight, 0);
	
	//Apply 移动菜单中的按钮位置
	with(oButtonCraft){
		y = ystart + other.cMenuScorll;
	}
	with(oButtonTitle){
		y = ystart + other.cMenuScorll;
	}
}