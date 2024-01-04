//生成标题按钮
function createButtonTitle(){
	///@desc Creates a title button 此脚本用于生成按钮
	///@arg x 坐标
	///@arg y
	///@arg w 宽高
	///@arg h
	///@arg title 标签
	
	//Args 将参数保存到局部变量
	var _x = argument[0];
	var _y = argument[1];
	var _w = argument[2];
	var _h = argument[3];
	var _title = argument[4];
	
	//Create button 生成oButtonTitle对象的实例
	var _inst = instance_create_depth(_x, _y, 0, oButtonTitle);
	
	with(_inst){//设置其属性
		width = _w;
		height = _h;
		
		title = _title;
	}
	
	return _inst;//返回实例
}