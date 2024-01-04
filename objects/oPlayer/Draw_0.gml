/// @description 
Juice_Draw(x, y);

//Show key 显示图标：按E键打开木箱
if(showkey != -1){
	var _scale = 1 + sin(current_time / 150) * 0.2;
	
	draw_sprite_ext(showkey, 0, x, y - 20, _scale, _scale, 0, -1, 1);
	
	showkey = -1;
}