/// @description 
//Draw back
draw_set_color(hover ? c_gray : c_black);//hover成立时为灰色，否则为黑色
draw_set_alpha(0.4);//透明度

draw_rectangle(x, y, x + width, y + height, 0);//绘制一个矩形

draw_set_alpha(1);
draw_set_color(c_white);

//Draw outline 绘制边框
draw_rectangle(x - 1, y - 1, x + width, y + height, 1);