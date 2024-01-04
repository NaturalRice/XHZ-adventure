
function init(){//告诉编译器在游戏开始之前运行某些代码（在加载第一个房间之前）
	gml_pragma("global","init()");
	
	//Placing 物品放置范围
	#macro PLACING_GRID_SIZE 16

#region
	//Items 枚举，定义了苹果，橘子，木头， 荔枝
	enum ITEM{
		APPLE,//默认下，值为0，1，2
		ORANGE,
		LYCHEE,
		WOOD,
		
		STONE,
		IRON,
		MARBLE,
		COPPER,
		GOLD,
		SANDPILE,
		CLAY,
		
		POTION,//可被制造出的物品
		SYRUP,
		APOTION,
		//零件
		GEAR,
		BEARING,
		SCREW,
		NUT,
		SPRING,
		WIRE,
		BATTERY,
		
		BLOCK_WOOD,
		BLOCK_IRON,
		BLOCK_ROCK,
		BLOCK_MARBLE,
		BLOCK_COPPER,
		BLOCK_GOLD,
		BLOCK_GLASS,
		BLOCK_CLAY,
		BLOCK_BRICK,
		ANGRY_STATUE,
		WOODEN_CHEST,
		WOODEN_CHEST_LARGE,
		//房子
		BLOCK_WALL,
		BLOCK_WALL1,
		BLOCK_WALL2,
		BLOCK_WALLBETWEEN,
		BLOCK_WALLOUTSIDE,
		WINDOW,
		WINDOWOUTSIDE,
		DOOR,
		//家具
		WORKBENCH,
		CLOCK,
		SOFA,
		TEATABLE,
		CABINET,
		WARDROBE,
		CALLIGRAPHYPAINTING,
		//弹药
		AMMO		
	}
#endregion

#region
	//为每个物品保存精灵图，想绘制什么图都可以从这取
	initItem(ITEM.APPLE, "Apple", sApple, [], undefined, 64);//苹果64个一组
	initItem(ITEM.ORANGE, "Orange", sOrange, [], undefined, 64);//橘子64个一组，下同。。。
	initItem(ITEM.LYCHEE, "Lychee", sLychee, [], undefined, 64);
	initItem(ITEM.WOOD, "Wood", sWood, [], undefined, 64);
	
	initItem(ITEM.STONE, "Stone", sStone, [], undefined, 64);
	initItem(ITEM.MARBLE, "Marble", sMarble, [], undefined, 64);
	initItem(ITEM.IRON, "Iron", sIron,[], undefined, 64);
	initItem(ITEM.COPPER, "Copper", sCopper,[], undefined, 64);
	initItem(ITEM.GOLD, "Gold", sGold,[], undefined, 64);
	initItem(ITEM.SANDPILE, "SandPile", sSandPile,[], undefined, 64);
	initItem(ITEM.CLAY, "Clay", sClay,[], undefined, 64);
	//物品合成表,显示合成物配方
	initItem(ITEM.POTION, "Potion", sPotion, [//药水
		[ITEM.APPLE, 4]
	]);
	initItem(ITEM.SYRUP, "Syrup", sSyrup, [//果汁
		[ITEM.ORANGE, 4],
		[ITEM.APPLE, 2]
	]);
	initItem(ITEM.APOTION, "Accelerating Potion", sAccelerating_Potion, [//加速药水
		[ITEM.LYCHEE, 1]
	]);
	//零件
	initItem(ITEM.GEAR, "Gear", sGear, [//齿轮
		[ITEM.IRON, 1]
	]);
	initItem(ITEM.BEARING, "Bearing", sBearing, [//轴承
		[ITEM.IRON, 1]
	]);
	initItem(ITEM.SCREW, "Screw", sScrew, [//螺丝
		[ITEM.IRON, 1]
	]);
	initItem(ITEM.NUT, "Nut", sNut, [//螺帽
		[ITEM.IRON, 1]
	]);
	initItem(ITEM.SPRING, "Spirng", sSpring, [//弹簧
		[ITEM.IRON, 1]
	]);
	initItem(ITEM.WIRE, "Wire", sWire, [//电线
		[ITEM.COPPER, 1]
	]);
	initItem(ITEM.BATTERY, "Battery", sBattery, [//电池
		[ITEM.COPPER, 1]
	]);
	//方块
	initItem(ITEM.BLOCK_WOOD, "Wood Block", sBlock_Wood, [//木板
		[ITEM.WOOD, 2]
	], oWoodBlock);
	initItem(ITEM.BLOCK_IRON, "Iron Block", sBlock_Iron, [//铁块
		[ITEM.IRON, 4]
	], oIronBlock);
	initItem(ITEM.BLOCK_ROCK, "Rock Block", sBlock_Rock, [//石块
		[ITEM.STONE, 2]
	], oRockBlock);
	initItem(ITEM.BLOCK_MARBLE, "Marble Block", sBlock_Marble, [//大理石块
		[ITEM.MARBLE, 2]
	], oMarbleBlock);
	initItem(ITEM.BLOCK_COPPER, "Copper Block", sBlock_Copper, [//铜块
		[ITEM.COPPER, 4]
	], oCopperBlock);
	initItem(ITEM.BLOCK_GOLD, "Gold Block", sBlock_Gold, [//金块
		[ITEM.GOLD, 4]
	], oGoldBlock);
	initItem(ITEM.BLOCK_GLASS, "Glass Block", sBlock_Glass, [//玻璃块
		[ITEM.SANDPILE, 1]
	], oGlassBlock);
	initItem(ITEM.BLOCK_CLAY, "Clay Block", sBlock_Clay, [//黏土块
		[ITEM.CLAY, 1]
	], oClayBlock);
	initItem(ITEM.BLOCK_BRICK, "Brick Block", sBlock_Brick, [//砖块
		[ITEM.STONE, 1],
		[ITEM.CLAY, 1]
	], oBrickBlock);
	//房间
	initItem(ITEM.BLOCK_WALL, "Wall Block", sBlock_Wall, [//墙
		[ITEM.BLOCK_BRICK, 3],
	], oWallBlock);
	initItem(ITEM.BLOCK_WALL1, "Wall Block1", sBlock_Wall1, [//墙1
		[ITEM.BLOCK_BRICK, 3],
	], oWallBlock1);
	initItem(ITEM.BLOCK_WALL2, "Wall Block2", sBlock_Wall2, [//墙1
		[ITEM.BLOCK_BRICK, 3],
	], oWallBlock2);
	initItem(ITEM.BLOCK_WALLBETWEEN, "WallBetween Block", sBlock_WallBetween, [//过渡墙
		[ITEM.BLOCK_BRICK, 3],
	], oWallBlockBetween);
	initItem(ITEM.BLOCK_WALLOUTSIDE, "WallOutside Block", sBlock_WallOutside, [//外墙
		[ITEM.BLOCK_BRICK, 3],
	], oWallBlockOutside);
	initItem(ITEM.WINDOW, "Window", sWindow, [//窗户
		[ITEM.BLOCK_BRICK, 8],
		[ITEM.BLOCK_GLASS, 1],
		[ITEM.BEARING, 2]
	], oWindow);
	initItem(ITEM.WINDOWOUTSIDE, "WindowOutside", sWindowOutside, [//外窗户
		[ITEM.BLOCK_BRICK, 8],
		[ITEM.BLOCK_GLASS, 1],
		[ITEM.BEARING, 2]
	], oWindowOutside);
	initItem(ITEM.DOOR, "Door", sDoor, [//门
		[ITEM.BLOCK_BRICK, 5],
		[ITEM.BLOCK_GLASS, 1],
		[ITEM.BEARING, 2]
	], oDoor);
	
	initItem(ITEM.ANGRY_STATUE, "Angry Statue", sAngryStatue, [//血怒雕像
		[ITEM.STONE, 3]
	], oAngryStatue);
	
	initItem(ITEM.WOODEN_CHEST, "Wooden Chest", sWoodenChest, [//木箱
		[ITEM.WOOD, 3]
	], oWoodenChest);
	
	initItem(ITEM.WOODEN_CHEST_LARGE, "Large Wooden Chest", sWoodenChestLarge, [//大木箱
		[ITEM.WOOD, 6]
	], oWoodenChestLarge);
	//家具
	initItem(ITEM.WORKBENCH, "Workbench", sWorkbench, [//工作台
		[ITEM.BLOCK_WOOD, 2],
		[ITEM.BLOCK_ROCK, 2],
		[ITEM.BLOCK_IRON, 2]	
	], oWorkbench);
	initItem(ITEM.CLOCK, "Clock", sClock, [//钟
		[ITEM.BLOCK_IRON, 1],	
		[ITEM.SCREW, 4],	
		[ITEM.NUT, 4]
	], oClock);
	initItem(ITEM.SOFA, "Sofa", sSofa, [//沙发
		[ITEM.BLOCK_WOOD, 3],	
		[ITEM.SCREW, 3],	
		[ITEM.SPRING, 3]
	], oSofa);
	initItem(ITEM.TEATABLE, "TeaTable", sTeaTable, [//茶几
		[ITEM.BLOCK_WOOD, 2],	
		[ITEM.MARBLE, 1]
	], oTeaTable);
	initItem(ITEM.CABINET, "Cabinet", sCabinet, [//柜子
		[ITEM.BLOCK_WOOD, 1],	
		[ITEM.SCREW, 3],
		[ITEM.NUT, 3]
	], oCabinet);
	initItem(ITEM.WARDROBE, "Wardrobe", sWardrobe, [//衣柜
		[ITEM.BLOCK_WOOD, 3],
		[ITEM.BEARING, 4],
		[ITEM.SCREW, 3],
	], oCabinet);
	initItem(ITEM.CALLIGRAPHYPAINTING, "CaliigraphyPainting", sCalligraphyPainting, [//字画
		[ITEM.BLOCK_WOOD, 1],
		[ITEM.SCREW, 1],
	], oCalligraphyPainting);
	initItem(ITEM.AMMO, "Ammo", sRocketItem, [//弹药
		[ITEM.IRON, 1],
		[ITEM.BATTERY, 1],
		[ITEM.WIRE, 1],
	], oRocketItem);
#endregion	
	
#region	
	//Inventory 一全局常量:背包里最多有12个物品栏
	#macro INV_SIZE 12
	
	//Crafting menu 合成物菜单的布局
	global.craftingMenu1 = [
		"CRAFTING",//菜单中的标题
		"Stats",
		ITEM.POTION,//按钮
		ITEM.SYRUP,
		ITEM.APOTION,
		ITEM.AMMO,//弹药
		"Parts",
		ITEM.GEAR,
		ITEM.BEARING,
		ITEM.SCREW,
		ITEM.NUT,
		ITEM.SPRING,
		ITEM.WIRE,
		ITEM.BATTERY,
	
		"Block",
		ITEM.BLOCK_WOOD,
		ITEM.BLOCK_ROCK,
		ITEM.BLOCK_IRON,
		ITEM.BLOCK_MARBLE,
		ITEM.BLOCK_GLASS,
		ITEM.BLOCK_CLAY,
		ITEM.BLOCK_BRICK,		
		ITEM.BLOCK_COPPER,
		ITEM.BLOCK_GOLD,
		
		"House",
		ITEM.BLOCK_WALL,
		ITEM.BLOCK_WALL1,
		ITEM.BLOCK_WALL2,
		ITEM.BLOCK_WALLOUTSIDE,
		ITEM.BLOCK_WALLBETWEEN,
		ITEM.WINDOW,
		ITEM.WINDOWOUTSIDE,
		ITEM.DOOR,
		
		"Statues",
		ITEM.ANGRY_STATUE,
		
		"Furniture",
		ITEM.WOODEN_CHEST,
		ITEM.WOODEN_CHEST_LARGE,
		ITEM.WORKBENCH,
		ITEM.CLOCK,
		ITEM.SOFA,
		ITEM.TEATABLE,
		ITEM.CABINET,
		ITEM.WARDROBE,
		ITEM.CALLIGRAPHYPAINTING
	];
#endregion

}