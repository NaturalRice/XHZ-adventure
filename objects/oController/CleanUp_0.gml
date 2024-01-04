/// @description 
camera_destroy(view_camera);//销毁摄像机
ds_list_destroy(invList);//房间关闭时，销毁存储物品清单的列表

//Remove pause surface 房间结束时，销毁表面
if(surface_exists(pauseSurf)){
	surface_free(pauseSurf);
}