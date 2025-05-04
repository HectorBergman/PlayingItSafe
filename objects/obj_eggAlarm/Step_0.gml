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
		if time >= alarmTime{
			eggState = eggStates.idle;
			time = 0;
		}
	}break;
}