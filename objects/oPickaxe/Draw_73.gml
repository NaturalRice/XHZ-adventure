/// @description
//Draw selector
if(instance_exists(selectorInst)){//检查是否存在selectorInst变量所保存ID的实例
	//Run code in selected instance
	with (selectorInst){
		//Draw selector in all corners 绘制选择器，每条语句对应正方形一个角
		draw_sprite_ext(sSelector, other.selectorFrame, bbox_left, bbox_top, 1, 1, 0, -1, 1);
		
		draw_sprite_ext(sSelector, other.selectorFrame, bbox_right, bbox_top, 1, 1, -90, -1, 1);
		
		draw_sprite_ext(sSelector, other.selectorFrame, bbox_right, bbox_bottom, 1, 1, 180, -1, 1);
		
		draw_sprite_ext(sSelector, other.selectorFrame, bbox_left, bbox_bottom, 1, 1, 90, -1, 1);
	}
	
	//Animation 每帧加0.15，做动画效果
	selectorFrame += 0.15;
	
	if(selectorFrame >= selectorFrameNumber) selectorFrame -= selectorFrameNumber;
	
	//Reset selector instance 清空变量
	selectorInst = noone;
}