debugTime++
print(x);
print(y);
print("-----");
//print(inPosition);

depth = -y;
if (global.pause && held){
	x = startCoords[0];
	y = startCoords[1];
	held = false;
}
PAUSE

//this structure is awful, so many !held that could have just been put
//under one if-statement. sorry!
if !complete{
	if miniHand.minigameStatus == status.finished{
		complete = true;
		exit;
	}
	if (!held){
		timeNotHeld++ //increases time the longer item is not held
	}else{
		timeNotHeld = 0;
	}
	if (!held && (!isCovered(id, obj_clearCheckHitbox_variant))){
		//if it's not currently held and either not completely inside the fridge 
		//(e.g. half the item is outside the freezer)
		if (!held && (!isCovered(id, obj_clearCheckHitbox_variant))) {
		    var hitboxList = ds_list_create();
		    instance_place_list(x, y, obj_clearCheckHitbox_variant, hitboxList, false);
    
		    var maxOverlap = -1;
		    var bestHitbox = noone;
    
		    for (var i = 0; i < ds_list_size(hitboxList); i++) {
		        var hitbox = hitboxList[| i];
        
		        //calculate overlap area
		        var overlapWidth  = min(bbox_right, hitbox.bbox_right)  - max(bbox_left, hitbox.bbox_left);
		        var overlapHeight = min(bbox_bottom, hitbox.bbox_bottom) - max(bbox_top, hitbox.bbox_top);
		        var overlapArea = overlapWidth * overlapHeight;
        
		        if (overlapArea > maxOverlap) {
		            maxOverlap = overlapArea;
		            bestHitbox = hitbox;
		        }
		    }
    
		    ds_list_destroy(hitboxList);
    
		    //snap to best hitbox
		    if (bestHitbox != noone) {
				var hx_center = (bestHitbox.bbox_left + bestHitbox.bbox_right) / 2;
		        var hy_center = (bestHitbox.bbox_top + bestHitbox.bbox_bottom) / 2;
				
		        x = hx_center - (bbox_right - bbox_left) / 2;
		        y = hy_center - (bbox_bottom - bbox_top) / 2+sprite_height;
		    }
		}
	
	}
	var area = noone;

	if (!held && place_meeting(x,y,obj_clearCheckHitbox_variant)){
		area = instance_place(x,y,obj_clearCheckHitbox_variant);
		if ds_list_find_index(area.holdingList,id) == -1{
			if area.holding < area.maxHolding{
				area.holding++
				ds_list_add(area.holdingList,id);
			}else{
				area.angryTimer = 0;
				area.textState = textStates.angryStart;
				x = startCoords[0]
				y = startCoords[1];
			}
		}
		/*if area.area == correctArea{ //area.area is the area code for each clearCheckHitbox, 0 for fridge,1 for freezer
			inPosition = true;		 //basically, checks if item is in the right place
		}else{
			inPosition = false;
		}*/
		correctTemperature(area);
		
	}else{
		winValue = winValues.noWin
	}
	if (held){
		depth = -999
	}else if !held && place_meeting(x,y,obj_button){
		x = startCoords[0]
		y = startCoords[1];
	}
}