panner = instance_find(obj_notePanner_1, 0)

//pointer = instance_find(obj_notePanner, 0)

cam = instance_find(obj_cam_dnd_1, 0);

if !isRead(){
	notification = summonObject(obj_notification_FF_1, [["parent", id], ["x",0],["y",0]]);
}

//temperatureText = getTemperatureListText()