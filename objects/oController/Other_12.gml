/// @description Create Chest UI 打开木箱时，事件开始
//Dimensions
var _margin = 10;//物品框边缘和界面之间的距离
var _sep = 4;//每个按钮的
var _cellSize = 24;//框大小

//Lists to show
var _listArray = [chestID.itemList, invList];
var _sizeArray = [chestID.maxItemCount, INV_SIZE];//大小
var _listCount = 2;//列表计数

//Create lists
for(var i = 0; i < _listCount; i++){
	//List ID & inventory size 获得库存规模
	var _list = _listArray[i];
	var _invSize = _sizeArray[i];
	
	//Size 计算按钮数量
	var _sizeX = _invSize / 2;//一排的按钮数
	var _sizeY = 2;//一列的按钮数
	
	//Area size 库存覆盖区域的大小
	var _areaWidth = (_cellSize + _sep) * _sizeX;//宽度
	var _areaHeight = (_cellSize + _sep) * _sizeY;//高度
	_areaWidth -= _sep;
	_areaHeight -= _sep;
	
	//Area position 按钮定位
	var _areaX = (RES.WIDTH / 2) - (_areaWidth / 2);
	var _areaY = _margin;
	
	if(i == 1) _areaY = RES.HEIGHT - (_margin + _areaHeight);
	
	//Start placing buttons 开始放置按钮
	var _x = 0;//存储按钮的位置
	var _y = 0;
	
	for(var j = 0; j < _invSize; j++){
		var _btnX = _areaX + (_cellSize + _sep) * _x;
		var _btnY = _areaY + (_cellSize + _sep) * _y;
		
		createButtonMoveable(_btnX, _btnY, _cellSize, _cellSize, _list, j);
		
		//Next position
		_x ++;
		
		if(_x == _sizeX){//此时在排的最后，则将x设置为0，回到第一列
			_x = 0;
			_y ++;
		}
	}
}