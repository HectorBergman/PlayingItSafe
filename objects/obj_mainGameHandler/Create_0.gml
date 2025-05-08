stationsAndAlerts = ds_list_create();
activeIndex = -1;


function generateNewInterval(interval,spread){
	return interval+(irandom_range(-spread,spread));
}
badOrderingWorkaround = true;

alertsActive = 0;
totalStations = 0;

