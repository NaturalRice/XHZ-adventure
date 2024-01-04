//@arg pos 按鼠标右键丢弃物品
//Args
function inv_remove(){
	var _pos = argument[0];
	
	//Remove
	var _list = oController.invList;
	
	_list[| _pos] = -1;
}