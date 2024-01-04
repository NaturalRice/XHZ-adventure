
function createButtonCraft(){
	///@desc Creates a crafting button for the specified item 脚本的描述信息，非必需
	///@arg x 定义的需要传递的参数
	///@arg y
	///@arg w
	///@arg h
	///@arg item 按下按钮后需要生成的物品
	
	//Args 参数逐一传递到本地局部变量中
	var _x = argument[0];
	var _y = argument[1];
	var _w = argument[2];
	var _h = argument[3];
	var _item = argument[4];
	
	//Create button 生成一个按钮实例
	var _inst = instance_create_depth(_x, _y, 0, oButtonCraft);
	
	with (_inst){//按钮属性
		width = _w;
		height = _h;
		
		item = _item;
	}
	
	return _inst;//返回按钮实例的ID
}


