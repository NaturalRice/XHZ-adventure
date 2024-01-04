
event_inherited();
/// @description 碰撞到符文后创建一个符文道具并销毁自身
//死亡音效
//audio_play_sound(aEnemyDead,1,false);
instance_create_depth(x,y,depth,oRocketItem);
hp = hp - 3;
instance_destroy(other);


