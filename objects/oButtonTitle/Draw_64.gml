/// @description
draw_set_font(ftTitle);//字体更改为ftTitle

draw_set_halign(fa_center);//对齐方式
draw_set_valign(fa_middle);
draw_text(x + width / 2, (y + height / 2) + 3, title);//绘制文本
draw_set_halign(fa_left);//重置对对齐方式
draw_set_valign(fa_top);