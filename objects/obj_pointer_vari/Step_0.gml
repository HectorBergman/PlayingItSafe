PAUSE
x = mouse_x
y = mouse_y

if (inHand.mouseHeld){
	if place_meeting(x,y,obj_holdable_parent) {		//if click & hold on item
		if !holding && !place_meeting(x,y,obj_doors){	
			var heldObjectList = ds_list_create()
			var lowestDepth = 999999;
			instance_place_list(x,y,obj_holdable_parent, heldObjectList, 0);
			for (var i = 0; i < ds_list_size(heldObjectList); i++) {
				var value = heldObjectList[| i];
				if value.depth < lowestDepth{
					lowestDepth = value.depth;
					heldObject = value;
				}							//picks up the "closest" item to player (lowest depth)
			}
			heldObject.held = true;
			xRelative = heldObject.x-x
			yRelative = heldObject.y-y
			holding = true;
			recencyGrabbedDepth--;
			heldObject.depth = -999			//some of this might be garbage & should be deleted...
			
		}
	}
	image_index = 1;
}else{
	if (heldObject != noone){
		if (heldObject.object_index != obj_thermometer){
			heldObject.depth = recencyGrabbedDepth	//maybe fix this so depth doesnt get messed up
													//after 2k clicks....
													//but basically what it does is give objects more
													//recently interacted with lower depth.
		}else{
			heldObject.depth = -998
		}
		heldObject.held = false;
	}
	image_index = 0
	holding = false;
	heldObject = noone;
}