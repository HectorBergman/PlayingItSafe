panner = instance_find(obj_notePanner, 0)

pointer = instance_find(obj_notePanner, 0)

cam = instance_find(obj_cam_dnd, 0);

itemHandler = instance_find(obj_itemHandler, 0);

dndHand = instance_find(obj_dndHandler, 0);
if !isRead(){
	notification = summonObject(obj_notification_dnd, [["parent", id], ["x",0],["y",0]]);
}

temperatureText = getTemperatureListText()