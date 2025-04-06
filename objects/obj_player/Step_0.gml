/// @description Insert description here
// You can write your code in this editor
collision_circle_list(x,y,interactRadius, obj_alert, false, true, nearbyAlerts, true)
if (!ds_list_empty(nearbyAlerts) && inHand.interact){ //if there are any nearby alerts,
											   //and the player hits the interact button
	var nearestAlert = ds_list_find_value(nearbyAlerts, 0);
	if (!collision_line(x,y,nearestAlert.x,nearestAlert.y, [obj_wall], 0, 1)){
		miniHand.currentMinigame = stringToEnum(nearestAlert.minigameEnum);
		miniHand.minigameStatus = status.started;
		room_goto(nearestAlert.minigame); //enter minigame if path from player to alert isnt blocked
	}
}
switch (state){
    case playerStates.normal: playerState_normal(); break;
}

if (place_meeting(x + movementX(), y, [obj_wall])){
	var _hStep = sign(movementX());
	stepCollisionWhileWithFailCon([obj_wall], _hStep, true) //1 unit at a time, step closer to the wall until
															//they touch
	movementVector[0] = 0;
}
if (place_meeting(x, y + movementY(), [obj_wall])){
	var _vStep = sign(movementY());
	stepCollisionWhileWithFailCon([obj_wall], _vStep, false)
	movementVector[1] = 0;
}


x += movementVector[0]*movementSpeed;
y += movementVector[1]*movementSpeed;
