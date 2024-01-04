/// @description 碰撞到火箭弹后创建一个火箭弹道具并销毁自身
//死亡音效
//audio_play_sound(aEnemyDead,1,false);
instance_create_depth(x,y,depth,oRocketItem);
//instance_create_depth(x,y,depth,oEnemyDeadEffect);
//调用攻击脚本
getAttacked(oPlayer);
hp = hp - 2;
instance_destroy(other);
