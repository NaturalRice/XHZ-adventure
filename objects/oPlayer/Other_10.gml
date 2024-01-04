/// @description Enable placing mode 加入物品放置模式

//Deactivate pickaxe
instance_deactivate_object(heldItem);//放置时不能使用镐子

//Enable placing mode
placingMode = true;

//Create placing instance
placingInst = instance_create_layer(mouse_x, mouse_y, "Instances", placingObj);
placingInst.image_alpha = 0.5;

//Clear mouse input 鼠标左键
mouse_clear(mb_left);