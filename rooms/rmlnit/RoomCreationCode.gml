//Resize game surface 更改游戏分辨率
surface_resize(application_surface, RES.WIDTH, RES.HEIGHT);

//Resize window 计算窗口的尺寸
var _windowWidth = RES.WIDTH * RES.SCALE;
var _windowHeight = RES.HEIGHT * RES.SCALE;

window_set_size(_windowWidth, _windowHeight);

//Start game 切换到下一个房间，游戏开始
room_goto_next();