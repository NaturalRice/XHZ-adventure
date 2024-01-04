/// @description 
//Hearts 血条
var _margin = 4;
var _startX = _margin;
var _startY = _margin;

var _size = sprite_get_height(sHeart);
var _dist = _size + _margin;

with (oPlayer){
	//Loop
	for(var i = 0; i < hp; i++){
		//Sub-image to draw 一颗心为0，半颗心为1
		var _subImg = 0;
		
		if(hp - i <= 0.5){
			_subImg = 1;
		}
		
		//Draw heart 绘制心
		draw_sprite(sHeart, _subImg, _startX + _dist * i, _startY);
	}
}
//移动物品过程中可看到物品本身
if(is_array(movingArray)){//若移动变量持有数组（正在移动一个项目）
	//Item data 获得项并绘制它
	var _item = movingArray[0];
	var _spr = global.itemSprite[_item];
	
	//Mouse position 获得鼠标在GUI层上的位置
	var _mouseX = device_mouse_x_to_gui(0);
	var _mouseY = device_mouse_y_to_gui(0);
	
	//Draw item 将精灵图绘制到坐标上
	draw_sprite(_spr, 0, _mouseX, _mouseY);
}

//绘制游戏分数
draw_set_halign(fa_center);//文本居中
draw_text(160,10,"SCORE:" + string(global.score));
draw_set_halign(fa_left);