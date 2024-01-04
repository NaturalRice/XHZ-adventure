/// @description 
//Resolution
enum RES{//全局常量：摄像机的宽度，高度，窗口的缩放比
	WIDTH = 320,
	HEIGHT = 180,
	SCALE = 4
}

//Create camera 创建的摄像机以ID的形式保存在这个局部变量中
var _camera = camera_create_view(0, 0, RES.WIDTH, RES.HEIGHT, 0, oPlayer, -1, -1, RES.WIDTH/2, RES.HEIGHT/2);

//Set up view
view_enabled = true;
view_visible[0] = true;

view_set_camera(0, _camera);

//Inventory 访问库存列表
invList = ds_list_create();

//Pause 暂停
pause = false;
//保存暂停界面
pauseSurf = -1;
//木箱
chestID = noone;
//移动数组
movingArray = -1;

//Crafting menu
cMenuScorll = 0;//滚动变量
cMenuHeight = 0;//菜单高度值

//初始化游戏字体
global.mainFont = font_add("Pixel NES.off", 7.5,false,false,0,32);
draw_set_font(global.mainFont);
//初始化游戏得分
global.score = 0;
//设置GUI尺寸
display_set_gui_size(320,180);