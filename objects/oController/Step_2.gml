/// @description 
var _playerExists = instance_exists(oPlayer);//检查实例是否存在
var _heldItem = noone;//没有实例

if(_playerExists) _heldItem = oPlayer.heldItem;

//Depth 深度，决定物体前后遮挡顺序
with (all){//对所有实例生效
	depth = -bbox_bottom;//y值越大，深度越低
	
	//Held item
	if (_playerExists && _heldItem == id){//检测玩家存在 && 实例是否为玩家持有物
		depth -= 10;//深度自减10，渲染在玩家层级之上
	}
}
