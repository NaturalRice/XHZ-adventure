function Juice_Step(){
	//Set
	xscale = lerp(xscale, xscaleTarget, scalingSpeed);
	yscale = lerp(yscale, yscaleTarget, scalingSpeed);
	
	//Reduce flash alpha 减去闪烁效果
	if(flashAlpha > 0){
		flashAlpha -= 0.1;
	}
}
