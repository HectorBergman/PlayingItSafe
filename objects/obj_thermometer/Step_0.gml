var shortestDistance = 999999;
closestZone = noone;
for (var i = 0; i < ds_list_size(temperatureZones); i++){
	var tempZone = ds_list_find_value(temperatureZones,i);
	var tempZoneX = tempZone.bbox_left+(tempZone.bbox_right-tempZone.bbox_left)/2
	var tempZoneY = tempZone.bbox_bottom+(tempZone.bbox_top-tempZone.bbox_bottom)/2
	var tempZoneDistance = point_distance(x,y, tempZoneX, tempZoneY)
	if tempZoneDistance < shortestDistance{
		shortestDistance = tempZoneDistance
		closestZone = tempZone;
		tempZoneXDebug = tempZoneX;
		tempZoneYDebug = tempZoneY;
	}
	print("------------");
	print(tempZone.area)
	print(tempZoneX);
	print(tempZoneY);
	print(tempZoneDistance);
	print(x);
	print(y);
}
if (closestZone != noone){
	currentTemperature = closestZone.temperature
}