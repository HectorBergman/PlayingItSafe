
interactable = true;
alert = noone;

timer = 0;


//for all below: edit in variable definitions

interval = interval; // todo: maybe make this ramp up
intervalSpread = intervalSpread; 

alertLifetime = alertLifetime;

difficulty = difficulty;// todo: make this ramp up


function generateNewInterval(interval,spread){
	return interval+(irandom_range(-spread,spread));
}

usedInterval = generateNewInterval(interval,intervalSpread);
