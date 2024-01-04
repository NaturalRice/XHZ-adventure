/// @description 如果存在目标则追击之
if chase and instance_exists(target){		

	move_towards_point(target.x,target.y,moveSpd);
}else{
	direction += image_xscale*5;//发射出去后沿着一个弧形漫游的效果
}

image_angle = direction;//动画的角度要跟运动的角度保持一致
/// @description 放大
if image_xscale < 1 and image_yscale < 1{
	image_xscale += 0.1;
	image_yscale += 0.1;
}
image_angle += 5;