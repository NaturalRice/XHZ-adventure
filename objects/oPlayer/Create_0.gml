/// @description 
Juice_Create();

//Properties
moveSpeed = 1;//每帧移动一个像素
moveSpeedMax = 3;//最高速度

knockbackSpeed = 4;

//Variables
moveX = 0;
moveY = 0;

boostX = 0;
boostY = 0;

//Create pickaxe 生成镐子实例
heldItem = instance_create_layer(x, y, "Instances", oPickaxe);

//Health 血条
hp = 5;
hpMax = hp;

//Placing mode物品放置模组
placingMode = false;
placingObj = noone;//oWoodBlock
placingInst = noone;

//Show key
showkey = -1;

//侦测半径
detectRad = 64;

//攻击CD
shootDelayInit = 120;//120帧，相当于2秒
shootDelay = shootDelayInit;
//弹药类型
myBullettype = oRocket;
ammo = 3;
//敌人列表（攻击列表中最近的敌人）
enemyList = ds_list_create();
targetEnemy = noone;