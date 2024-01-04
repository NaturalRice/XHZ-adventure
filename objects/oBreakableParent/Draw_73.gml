/// @description 

//Draw healthbar 绘制生命条
if(hp < hpMax){//玩家是否点击了可破坏对象
	//Healthbar Y
	var _y = bbox_bottom + 1;
	
	//Draw healthbar fill 血条代码
	var _amount = hp / hpMax;//生命百分比
	var _width = bbox_right - bbox_left;//血条宽度等于遮罩宽度
	
	draw_set_color(hpColor);//颜色
	draw_rectangle(bbox_left, _y, bbox_left + _width * _amount, _y + hpHeight, 0);//方框
	draw_set_color(-1);//颜色为白色
	
	//Draw healthbar border 生命条边框
	draw_rectangle(bbox_left, _y, bbox_right, _y + hpHeight, 1);
}
	