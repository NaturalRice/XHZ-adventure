function createButtonMoveable(){//创建一个可移动的按钮实例
	///@desc Creates a moveable button for the specified list & slot
	///@arg x
	///@arg y
	///@arg w
	///@arg h
	///@arg list
	///@arg slot
	
	//Args
	var _x = argument[0];
	var _y = argument[1];
	var _w = argument[2];
	var _h = argument[3];
	var _list = argument[4];
	var _slot = argument[5];
	
	//Create button
	var _inst = instance_create_depth(_x, _y, 0, oButtonInvMoveable);
	
	with(_inst){
		width = _w;
		height = _h;
		
		list = _list;
		slotID = _slot;
	}
	
	return _inst;
}
