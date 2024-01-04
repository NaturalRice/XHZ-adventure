/// @description 
//Mouse input 鼠标输入
var _held = hover && mouse_check_button(mb_left);

//Click to craft 点击制作物品
if(_held && craftAnim <= 0){
	//Get recipe 得到配方
	var _recipe = global.itemRecipe[item];
	var _recipeSize = array_length_1d(_recipe);
	
	//Check ingredients 检查合成材料（可以合成物品）
	var _canCraft = true;
	
	for(var i = 0; i < _recipeSize; i++){
		//Get ingredient data 种类和数量
		var _ingr = _recipe[i];
		var _item = _ingr[0];
		var _count = _ingr[1];
		
		//Get item array
		var _arr = inv_get_item_array(_item);
		
		if(!is_array(_arr)){//材料不足时
			_canCraft = false;
			break;
		}
		
		//Check count 
		var _arrCount = _arr[1];
		
		if(_arrCount < _count){//材料数量不够时
			_canCraft = false;
			break;
		}
	}
	
	//Start carfting animation
	if(_canCraft){
		craftAnim = 0.02;
	}
}

//Crafting animation
if(_held && craftAnim > 0){
	craftAnim += 0.02;
	
	//Craft
	if(craftAnim >= 1){
		event_user(0);
		craftAnim = 0;
	}
}
else{
	craftAnim = 0;
}
		