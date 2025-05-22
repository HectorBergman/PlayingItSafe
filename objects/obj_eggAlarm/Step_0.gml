PAUSE
switch (eggState){
	case eggStates.idle:{
		if place_meeting(x,y,obj_cookFoodHand) && inHand.mouseClick{
			eggState = eggStates.counting
		}
	}break;
	case eggStates.counting:{
		if time mod 4 == 0{
			image_angle = time/4-timer/4
		}
		time++
		if time >= timer{
			eggState = eggStates.alarming;
			time = 0;
		}
	}break;
	case eggStates.alarming:{
		time++
		if time mod 11 == 0{
			var xOffset = 0;
			var yOffset = 0;
			if rings == 0 {
				xOffset = -80;
				yOffset = -90;
			}else if rings == 1{
				xOffset = 80;
				yOffset = 0;
			}else if rings == 2{
				xOffset = -80;
				yOffset = 90;
			}
			xOffset += irandom_range(-30,30);
			yOffset += irandom_range(-30,30);
			summonObject(obj_alarmText, [["parent", id], ["xOffset", xOffset], ["yOffset", yOffset], ["depth", depth-1]]);
			rings++;
		}
		if time >= alarmTime{
			eggState = eggStates.idle;
			time = 0;
			rings = 0;
		}
	}break;
}