/// @description 
//Check count 制作物品消耗完的材料使物品栏空出
var _arr = oController.invList[| slotID];

if(is_array(_arr)){
	var _count = _arr[1];
	
	//Remove
	if(_count <= 0){
		inv_remove(slotID);
	}
}