/// @description 

// Inherit the parent event 创造菜单的图标和文字
event_inherited();

//Crafting animation物品制作
if(craftAnim > 0){
	draw_rectangle(x, y, x + width * craftAnim, y + height, 0);
}

//Properties
var _margin = 4;

//Calculate image scale 改变Button大小，计算坐标
var _size = 8;
var _sizeNew = height - _margin * 2;
var _scale = _sizeNew / _size;

//Draw item 物品图像
var _spr = global.itemSprite[item];

draw_sprite_ext(_spr, 0, x + _margin + _sizeNew / 2, y + _margin + _sizeNew / 2,
_scale, _scale, 0, c_white, 1);

//Draw name 物品名称
var _name = global.itemName[item];

draw_set_font(ftUI);

draw_text(x + _margin * 2 + _sizeNew, y + _margin + 2, _name);