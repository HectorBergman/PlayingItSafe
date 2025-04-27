currentTemperature = 20;
scale = 0.5
image_xscale = scale
image_yscale = scale
temperatureZones = ds_list_create();

//cleaner to do a list and then sort it
//but that takes more time

//if this code needs to be expanded to be more general ill do it
closestZone = noone;
secondClosestZone = noone;
thirdClosestZone = noone;
fourthClosestZone = noone;

tempZoneXDebug = 0;
tempZoneYDebug = 0
tempZoneXDebug2 = 0;
tempZoneYDebug2 = 0
tempZoneXDebug3 = 0;
tempZoneYDebug3 = 0
tempZoneXDebug4 = 0;
tempZoneYDebug4 = 0

shortestDistance = 999996;
secondShortestDistance = 999997;
thirdShortestDistance = 999998;
fourthShortestDistance = 999999;

goalTemperature = 20;

temperatureTickStepMiddle = 1;
temperatureTickStepRange = [-0.5,0.5]
temperatureTickStep = temperatureTickStepMiddle;

temperatureTick = 0;
temperatureTickTimeMiddle = 10;
temperatureTickTimeRange = [-3,3]
temperatureTickTime = temperatureTickTimeMiddle;
function findAllTemperatureAreas(){
	for (var i = 0; i < instance_number(obj_clearCheckHitbox_variant); i++){
		var tempZone = instance_find(obj_clearCheckHitbox_variant, i);
		ds_list_add(temperatureZones, tempZone);
	}
}
findAllTemperatureAreas();