holding = 0;
holdingList = ds_list_create();

defaultTemp = temperature;
enum textStates {
	normal,
	angryStart,
	angry,
}
textState = textStates.normal;
angryTimer = 0;
angryTime = 30;
depth = -1500
dndHand = noone;


function drawTextNormal(){
	//TweenFire(id,EaseInOutQuad, 2,false,0,10,"angryAlpha",1);
	var text = ""
	text = "[scale,1][$eee7e7]" + string(holding) + "/" + string(maxHolding); 
	var toDraw = scribble(text).align(fa_center, fa_middle);
	toDraw.draw(bbox_left+32, bbox_top+32);
}

function drawTextAngry(){
	text = "[scale,1][$c24242][shake]" + string(holding) + "/" + string(maxHolding); 
	toDraw = scribble(text).align(fa_center, fa_middle);
	toDraw.draw(bbox_left+32, bbox_top+32);
}