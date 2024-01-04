/// @description
Juice_Step();

if (hp <= 0) {
	instance_destroy();
	
	//How many resources to create
	var _resCount = choose(1, 2, 3, 4);//显示将要掉落的资源数量（随机选择）
	if(resCount != -1) _resCount = resCount;
	
	var _resMax = array_length_1d(res);//获取资源的数量
	
	//Create resources
	repeat(_resCount){//执行一个循环
		//Get random resource
		var _resID = irandom(_resMax - 1);//获取将要创建的对象的数组元素编号（随机）
		
		var _res = res[_resID];//用_resID从res数组中获取将要创建的资源
		
		//Item position 资源将被创建的X，Y位置
		var _x = x + irandom_range(-4, 4);
		var _y = y + irandom_range(-4, 4);
		
		//Create oItem 创建物品实例
		var _inst = instance_create_layer(_x, _y, "Instances", oItem);
		
		//Set item properties
		with(_inst){
			type = _res;//将物品的类型变量设置为从res数组获取的资源
			
			sprite_index = global.itemSprite[_res];//设置物品实例的精灵图索引
			
			z = -other.sprite_height / 2;//掉落动画Z值取决于破坏对象实例的高度
		}
	}
}