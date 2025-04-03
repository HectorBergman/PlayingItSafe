/// @description Insert description here
// You can write your code in this editor
collision_circle_list(x,y,interactRadius, obj_alert, false, true, nearbyAlerts, true)
if (!ds_list_empty(nearbyAlerts) && interact){
	var nearestAlert = ds_list_find_value(nearbyAlerts, 0);
	room_goto(nearestAlert.minigame);
}
switch (state){
    case playerStates.normal: playerState_normal(); break;
}

if (place_meeting(x + movementX(), y, [obj_wall])){
	var _hStep = sign(movementX());
	stepCollisionWhileWithFailCon([obj_wall], _hStep, true)
	movementVector[0] = 0;
}
if (place_meeting(x, y + movementY(), [obj_wall])){
	var _vStep = sign(movementY());
	stepCollisionWhileWithFailCon([obj_wall], _vStep, false)
	movementVector[1] = 0;
}


x += movementVector[0]*movementSpeed;
y += movementVector[1]*movementSpeed;
