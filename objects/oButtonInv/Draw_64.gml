/// @description 

// Inherit the parent event
event_inherited();

//Get array from list 从库存系统中获取物品数组
var _list = oController.invList;
var _arr = _list[| slotID];

//Draw item 绘制其中物品
if(is_array(_arr)){//检查参数是否为一数组
	var _item = _arr[0];//获取物品ID
	var _spr = global.itemSprite[_item];//获取精灵图
	
	draw_sprite(_spr, 0, x + width / 2, y + height / 2);//在按钮中心绘制物品精灵图
	
	//Draw count 绘制数量文本
	var _count = _arr[1];//从数组的第二个元素获取物品数量
	
	draw_set_font(ftUI);//使用字体ftUI
	draw_text(x + 2, y + 4, _count);//在此处绘制文本内容
}