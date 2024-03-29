///@desc Gets the array from an item 配方合成
///@arg item
function inv_get_item_array(){
	//Args
	var _item = argument[0];
	
	//Get list
	var _list = oController.invList;
	var _listSize = ds_list_size(_list);
	
	//Get array from list
	for(var i = 0; i < _listSize; i++){
		//Array data
		var _arr = _list[| i];
		
		if(is_array(_arr)){
			var _arrItem = _arr[0];
			
			//Check
			if(_arrItem == _item){
				return _arr;
			}
		}
	}
	
	//Not found
	return -1;
}