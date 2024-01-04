function Juice_Draw(){//绘制脚本
	///@arg x
	///@arg y
	
	///Args
	var _x = argument[0];
	var _y = argument[1];
	
	//Draw sprite ext绘制精灵，将图像的刻度与自己的刻度相乘，将缩放动画应用于实例
	draw_sprite_ext(sprite_index, image_index, _x, _y, image_xscale * xscale, image_yscale * yscale, image_angle, image_blend, image_alpha);
	
	//Draw flash 绘制闪光
	if(flashAlpha > 0){
		shader_set(shFlash);//设置着色器
		
		draw_sprite_ext(sprite_index, image_index, _x, _y, image_xscale * xscale, image_yscale * yscale, image_angle, flashColor, flashAlpha);
		
		shader_reset();//重置着色器
	}
}
