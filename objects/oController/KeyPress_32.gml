/// @description 
var _item = ITEM.APPLE;
var _count = 10;
var _stackSize = global.itemStackSize[_item];

while(_count > 0){
	inv_add(_item, min(_stackSize, _count));
	_count -= _stackSize;
}
