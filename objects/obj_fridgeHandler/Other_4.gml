dndHand = instance_find(obj_dndHandler, 0);
if !dndHand.changeableTemperature{
	temperatureDifference = 0;
	visible = false;
}

for (var i = 0; i < instance_number(obj_clearCheckHitbox_variant); i++){
	var inst = instance_find(obj_clearCheckHitbox_variant, i);
	if inst.area != -1{
		ds_list_add(hitboxList, inst);
	}
}