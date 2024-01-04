/// @description GUI元素绘制前，会先绘制暂停表面
//Pause surface
if(pause && surface_exists(pauseSurf)){
	draw_surface_ext(pauseSurf, 0, 0, 1, 1, 0, c_gray, 1);
}