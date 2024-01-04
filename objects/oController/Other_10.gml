/// @description Create Inv UI
//用户事件不会自动触发，在需要的时候手动触发（创建物品系统界面）
#region Inventory
//Dimensions
var _margin = 10;//按钮和窗口的边距
var _sep = 4;//按钮间的距离
var _cellSize = 24;//按钮尺寸

//Inventory items 物品栏的尺寸（一共12个按钮）
var _sizeX = 6;
var _sizeY = 2;

//Coordinates 
var _invX = _margin;
var _invY = RES.HEIGHT - (_margin + _sep + _cellSize * _sizeY)//物品栏显示在窗口底部

//Create buttons 当前列，行的值
var _x = 0;
var _y = 0;

for(var i=0; i<INV_SIZE; i++){
	//Button coordinates 计算每个按钮的坐标值
	var _buttonX = _invX + (_sep + _cellSize) * _x;
	var _buttonY = _invY + (_sep + _cellSize) * _y;
	
	//Create button 创建按钮
	var _button = instance_create_depth(_buttonX, _buttonY, 0, oButtonInv);
	
	//Set properties 修改按钮一些属性
	with(_button){
		slotID = i;//显示物品栏中该槽位的物品
		
		width = _cellSize;//按钮宽高
		height = _cellSize;
	}
	
	//Move position 切换到下一行列
	_x ++;
	
	if(_x == _sizeX){
		_x = 0;//到底后回到最开头
		_y ++;
	}
}
#endregion

#region Crafting
//Properties 菜单属性
var _w = 120;//宽度
var _h = 26;//每个建造按钮高度
var _x = RES.WIDTH - (_w + _margin);//位置坐标
var _y = _sep;

var _titleH = 12;//标题高度

//Create crafting buttons 创建一个创造菜单
var _arr = global.craftingMenu1;//获取代表这个菜单布局的数组
var _size = array_length_1d(_arr);//获取数组的长度

for(var i=0; i<_size; i++){//获取当前元素
	var _item = _arr[i];
	
	//Title 判断当前元素是否为字符
	if(is_string(_item)){
		createButtonTitle(_x, _y, _w, _titleH, _item); //createButtonTitle 新建一个标题按钮
		
		_y += (_titleH + _sep);//得到下一个按钮的_y值
	}
	//Crafting button 否则建造一个创造按钮
	else{
		createButtonCraft(_x, _y, _w, _h, _item);
		
		_y += (_h + _sep);//下一个按钮
	}
}

cMenuHeight = _y - RES.HEIGHT;//滚动窗口高度
#endregion