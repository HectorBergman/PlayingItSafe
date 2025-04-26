currentTemperature = 0;
scale = 0.5
image_xscale = scale
image_yscale = scale
temperatureZones = ds_list_create();
closestZone = noone;
tempZoneXDebug = 0;
tempZoneYDebug = 0
function findAllTemperatureAreas(){
	for (var i = 0; i < instance_number(obj_clearCheckHitbox_variant); i++){
		print("hej");
		var tempZone = instance_find(obj_clearCheckHitbox_variant, i);
		ds_list_add(temperatureZones, tempZone);
	}
}
findAllTemperatureAreas();