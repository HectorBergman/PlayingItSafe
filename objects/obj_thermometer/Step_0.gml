///Most of this code was written by Hector but then later improved upon by Deepseek,
///hence why it looks AI-generated. Because it kind of is (but not fully)
// Initialize all distances to infinity (or a very large number)
shortestDistance = infinity;
secondShortestDistance = infinity;
thirdShortestDistance = infinity;
fourthShortestDistance = infinity;

// Initialize all zone references to undefined
closestZone = undefined;
secondClosestZone = undefined;
thirdClosestZone = undefined;
fourthClosestZone = undefined;

for (var i = 0; i < ds_list_size(temperatureZones); i++) {
    var tempZone = ds_list_find_value(temperatureZones, i);
    var tempZoneDistance = pointToBBoxDistance(x, y, tempZone.bbox_left, tempZone.bbox_top, tempZone.bbox_right, tempZone.bbox_bottom);
    
    // Calculate center (for debugging)
    var tempZoneX = tempZone.bbox_left + (tempZone.bbox_right - tempZone.bbox_left) / 2;
    var tempZoneY = tempZone.bbox_bottom + (tempZone.bbox_top - tempZone.bbox_bottom) / 2;
    
    // Check and update all categories in proper order
    if (tempZoneDistance < shortestDistance) {
        // Shift all categories down
        fourthShortestDistance = thirdShortestDistance;
        fourthClosestZone = thirdClosestZone;
        tempZoneXDebug4 = tempZoneXDebug3;
        tempZoneYDebug4 = tempZoneYDebug3;
        
        thirdShortestDistance = secondShortestDistance;
        thirdClosestZone = secondClosestZone;
        tempZoneXDebug3 = tempZoneXDebug2;
        tempZoneYDebug3 = tempZoneYDebug2;
        
        secondShortestDistance = shortestDistance;
        secondClosestZone = closestZone;
        tempZoneXDebug2 = tempZoneXDebug;
        tempZoneYDebug2 = tempZoneYDebug;
        
        // Set new closest
        shortestDistance = tempZoneDistance;
        closestZone = tempZone;
        tempZoneXDebug = tempZoneX;
        tempZoneYDebug = tempZoneY;
    }
    else if (tempZoneDistance < secondShortestDistance) {
        // Shift categories 2-4 down
        fourthShortestDistance = thirdShortestDistance;
        fourthClosestZone = thirdClosestZone;
        tempZoneXDebug4 = tempZoneXDebug3;
        tempZoneYDebug4 = tempZoneYDebug3;
        
        thirdShortestDistance = secondShortestDistance;
        thirdClosestZone = secondClosestZone;
        tempZoneXDebug3 = tempZoneXDebug2;
        tempZoneYDebug3 = tempZoneYDebug2;
        
        // Set new second closest
        secondShortestDistance = tempZoneDistance;
        secondClosestZone = tempZone;
        tempZoneXDebug2 = tempZoneX;
        tempZoneYDebug2 = tempZoneY;
    }
    else if (tempZoneDistance < thirdShortestDistance) {
        // Shift categories 3-4 down
        fourthShortestDistance = thirdShortestDistance;
        fourthClosestZone = thirdClosestZone;
        tempZoneXDebug4 = tempZoneXDebug3;
        tempZoneYDebug4 = tempZoneYDebug3;
        
        // Set new third closest
        thirdShortestDistance = tempZoneDistance;
        thirdClosestZone = tempZone;
        tempZoneXDebug3 = tempZoneX;
        tempZoneYDebug3 = tempZoneY;
    }
    else if (tempZoneDistance < fourthShortestDistance) {
        // Set new fourth closest
        fourthShortestDistance = tempZoneDistance;
        fourthClosestZone = tempZone;
        tempZoneXDebug4 = tempZoneX;
        tempZoneYDebug4 = tempZoneY;
    }
}

// Smoothstep helper function
function smoothstep(min, max, value) {
    var _x = clamp((value - min) / (max - min), 0, 1);
    return _x * _x * (3 - 2 * _x);
}
if (closestZone != noone) {
    // Calculate weights using modified inverse distance
    var w1 = 1 / (shortestDistance + 1);
    var w2 = 1 / (secondShortestDistance + 1);
    var w3 = 1 / (thirdShortestDistance + 1);
    var w4 = 1 / (fourthShortestDistance + 1);

    // Special handling for outdoor zones (area == -1)
    // Reduce outdoor influence more gradually based on distance
    if (closestZone.area != -1) {
        // When indoor, apply distance-based outdoor influence reduction
        var outdoorInfluence = 0.3; // Base outdoor influence factor
        
        if (secondClosestZone.area == -1) {
            var outdoorBlend = smoothstep(50, 150, secondShortestDistance);
            w2 *= outdoorInfluence * (1 - outdoorBlend);
        }
        if (thirdClosestZone.area == -1) {
            var outdoorBlend = smoothstep(100, 200, thirdShortestDistance);
            w3 *= outdoorInfluence * (1 - outdoorBlend);
        }
        if (fourthClosestZone.area == -1) {
            var outdoorBlend = smoothstep(150, 250, fourthShortestDistance);
            w4 *= outdoorInfluence * (1 - outdoorBlend);
        }
    } else {
        // When outdoor, blend with indoor zones gradually
        var indoorInfluence = 0.5; // Maximum indoor influence when outdoor
        
        if (secondClosestZone.area != -1) {
            var indoorBlend = smoothstep(50, 150, secondShortestDistance);
            w2 *= indoorInfluence * (1 - indoorBlend);
        }
        if (thirdClosestZone.area != -1) {
            var indoorBlend = smoothstep(100, 200, thirdShortestDistance);
            w3 *= indoorInfluence * (1 - indoorBlend);
        }
        if (fourthClosestZone.area != -1) {
            var indoorBlend = smoothstep(150, 250, fourthShortestDistance);
            w4 *= indoorInfluence * (1 - indoorBlend);
        }
    }

    // Normalize weights
    var sum = w1 + w2 + w3 + w4;
    w1 /= sum; w2 /= sum; w3 /= sum; w4 /= sum;

    // Calculate final temperature
    goalTemperature = closestZone.temperature * w1;
    if (secondClosestZone != noone) goalTemperature += secondClosestZone.temperature * w2;
    if (thirdClosestZone != noone) goalTemperature += thirdClosestZone.temperature * w3;
    if (fourthClosestZone != noone) goalTemperature += fourthClosestZone.temperature * w4;
}



if (currentTemperature != goalTemperature) {
	temperatureTick++
	if (temperatureTick mod temperatureTickTime == 0){
		
		
	    var tempDiff = goalTemperature - currentTemperature;
	    var change = sign(tempDiff) * min(abs(tempDiff) * 0.2, temperatureTickStep);
	    currentTemperature += change;
    
	    // Snap when close enough
	    if (abs(tempDiff) < 0.05) {
	        currentTemperature = goalTemperature;
	    }
		temperatureTick = temperatureTickTimeMiddle+irandom_range(temperatureTickTimeRange[0],temperatureTickTimeRange[1]);
		temperatureTickStep = temperatureTickStepMiddle+random_range(temperatureTickStepRange[0],temperatureTickStepRange[1]);
	}
}


