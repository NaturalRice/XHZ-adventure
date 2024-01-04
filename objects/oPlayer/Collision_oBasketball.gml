/// @description 碰撞到篮球后销毁自身,玩家扣1滴血
//死亡音效
//audio_play_sound(aEnemyDead,1,false);
//instance_create_depth(x,y,depth,oEnemyDeadEffect);
//调用攻击脚本
getAttacked(other);
instance_destroy(other);