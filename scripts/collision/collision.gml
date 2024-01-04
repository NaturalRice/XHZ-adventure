///@arg x
///@arg y
function collision (argument0, argument1) {	
	return place_meeting(argument0, argument1, oCollision);//碰撞检测	
}


///@arg x
///@arg y
function collision_entity (argument0, argument1) {	
	return place_meeting(argument0, argument1, oPlayer) || place_meeting(argument0, argument1, oNPCParent);//碰撞检测(敌人)	
}