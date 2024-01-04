/// @description 玩家的弹药增加1 并销毁自身
//拾取音效
//audio_play_sound(aPickUp,1,false);
other.ammo = other.ammo + 1;
instance_destroy();