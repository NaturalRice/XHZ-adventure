///@arg item
///@arg count
function inv_add(){
	
	// Args
	var _item = argument[0];//物品类型
	var _count = argument[1];//物品数量
	
	var _list = oController.invList;
	
	//Item already exists in list 检查该项是否在列表中
	var _listSize = ds_list_size(_list);//获取函数大小
	
	for(var i = 0; i < _listSize; i++){
		//Get array
		var _arr = _list[| i];
		
		//Check item 存在时，增加物品数量
		if(is_array(_arr) && _arr[0] == _item){
			var _maxStackSize = global.itemStackSize[_item];
			var _updatedStackSize = _arr[1] + _count;//槽的总数：现有计数和正在添加的新计数相加
			
			_arr[@ 1] = min(_updatedStackSize, _maxStackSize);//确保插槽数量不超过堆栈限制
			
			//Continue if more is left 检查是否还有剩余的数
			var _leftover = _updatedStackSize - _maxStackSize;
			
			if(_leftover > 0){
				_count = _leftover;
				continue;
			}
			
			return true;
		}
	}
	
	//Insert array 丢弃物品后空出的栏可以重新利用
	for(var i = 0; i < _listSize; i++){
		//Get array
		var _arr = _list[| i];
		
		//Empty slot
		if(!is_array(_arr)){
			_list[| i] = [_item, _count];
			
			return true;
		}
	}
	
	//Inventory is full
	if(_listSize >= INV_SIZE){
		return false;
	}
	
	//Create new array 不存在则新建一数组【物品，数量】
	var _arr = [_item, _count];
	
	ds_list_add(_list, _arr);
	
	return true;
}