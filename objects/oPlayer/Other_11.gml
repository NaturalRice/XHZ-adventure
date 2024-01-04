/// @description Disable placing mode 放置模式无效时

//Deactivate pickaxe
instance_activate_object(heldItem);

//Disable placing mode
placingMode = false;

//Reset placing instance
placingInst.image_alpha = 1;
placingInst = noone;

//Clear mouse input 鼠标左键
mouse_clear(mb_left);