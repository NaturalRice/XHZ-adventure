/// @description 

// Inherit the parent event
event_inherited();

//Sprites
spriteIdle = sEnemy4;
spriteMove = sEnemy4Move;

hp = 60;//需要火箭弹打6下

followDistance = 100;

//侦测半径
detectRad = 80;
//攻击CD
shootDelayInit = 60;//60帧，相当于1秒
shootDelay = shootDelayInit;
//弹药类型:篮球10个,鸡蛋10个
myBullettype = oBasketball;
myBullettype2 = oEgg;
ammo = 10;
ammo2 = 10;
//敌人列表（攻击列表中最近的敌人）
enemyList = ds_list_create();
targetEnemy = noone;