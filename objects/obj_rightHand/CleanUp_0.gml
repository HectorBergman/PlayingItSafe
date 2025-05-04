// Destroy all water drops when hand is destroyed
for (var i = 0; i < array_length(waterDrops); i++) {
    if (instance_exists(waterDrops[i])) {
        instance_destroy(waterDrops[i]);
    }
}
waterDrops = [];

// Destroy all water drops when leaving WET state
for (var i = 0; i < array_length(soapBubbles); i++) {
	if (instance_exists(soapBubbles[i])) {
	    instance_destroy(soapBubbles[i]);
	}
}
soapBubbles = [];