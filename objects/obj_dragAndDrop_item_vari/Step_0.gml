debugTime++

//print(inPosition);

depth = -y;
if (global.pause && held){
	x = startCoords[0];
	y = startCoords[1];
	held = false;
}
PAUSE
if !complete{
	if miniHand.minigameStatus == status.finished{
		complete = true;
		exit;
	}
	if (!held){
		if !place_meeting(x,y,obj_clearCheckHitbox_variant){
			image_index = 0;
		}
		timeNotHeld++ //increases time the longer item is not held
		}else{
			image_index = 1;
			timeNotHeld = 0;
		}
	if (!held && (!isCovered(id, obj_clearCheckHitbox_variant) ||  
				   timeNotHeld == 1 && place_meeting(x,y,obj_doors))){
		//if it's not currently held and either not completely inside the fridge 
		//(e.g. half the item is outside the freezer)
		//or if item was just dropped on a door (to prevent placing items inside closed doors)
		x = startCoords[0]
		y = startCoords[1];
	
	}
	var area = noone;

	if (!held && place_meeting(x,y,obj_clearCheckHitbox_variant)){
		area = instance_place(x,y,obj_clearCheckHitbox_variant);
		if area.area == correctArea{ //area.area is the area code for each clearCheckHitbox, 0 for fridge,1 for freezer
			inPosition = true;		 //basically, checks if item is in the right place
		}else{
			inPosition = false;
		}
		
	}else{
		inPosition = false;
	}
	if (held){
		depth = -999
	}
}