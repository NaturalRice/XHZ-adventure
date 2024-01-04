/// @description 
//input
var _mouseX = device_mouse_x_to_gui(0);//从GUI层获取鼠标的坐标
var _mouseY = device_mouse_y_to_gui(0);

hover = point_in_rectangle(_mouseX, _mouseY, x, y, x + width, y + height);//鼠标悬停于矩形按钮识别区域内

lclick = mouse_check_button_pressed(mb_left);//鼠标的点击输入（按下）
rclick = mouse_check_button_pressed(mb_right);