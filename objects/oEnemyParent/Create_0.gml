/// @description 
// Inherit the parent event
event_inherited();


//Properties 敌人距离玩家近时移动更快
moveSpeedRoam = 0.5;
moveSpeedFollow = 0.9;

moveSpeed = moveSpeedRoam;

targetX = 0;
targetY = 0;

//Following
following = false;//值为真时跟随玩家，假时漫游
followDistance = 80;//跟踪判定范围

//Roaming
roamDistance = 64;//漫游范围
roamTime = 0;

//Attack
attackCooldown = 0;//攻击CD
attackRadius = 8;//攻击碰撞范围