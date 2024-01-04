/// @description 检测玩家是否在移动一个物品
if(hover && lclick){//左键单击时
	//Already moving an array
	if(is_array(oController.movingArray)){
		var _arr = list[| slotID];
		
		//My slot is empty
		if(!is_array(_arr)){//检测按钮插槽是否为空
			list[| slotID] = oController.movingArray;
			oController.movingArray = -1;
		}
		//My slot has an item
		else{
			var _myItem = _arr[0];
			var _newItem = oController.movingArray[0];
			
			//Same items 相同物品可以放入同一框加和
			if(_myItem == _newItem){
				_arr[@ 1] += oController.movingArray[1];
				oController.movingArray = -1;
			}
		}
	}
	//Not moving anything 没移动任何物品
	else{
		var _arr = list[| slotID];
		
		if(is_array(_arr)){
			oController.movingArray = _arr;
			list[| slotID] = -1;
		}
	}
}