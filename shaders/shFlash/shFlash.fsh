//片段着色器
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()//整个主函数对每个像素运行一次,实现闪烁颜色功能
{
    gl_FragColor = texture2D( gm_BaseTexture, v_vTexcoord );
	gl_FragColor.a *= v_vColour.a;
	gl_FragColor.rgb = v_vColour.rgb;
}
