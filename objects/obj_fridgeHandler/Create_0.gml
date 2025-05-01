hitboxList = ds_list_create()
depth = -100;
temperatureLimits = [-5,5];
temperatureDifference = irandom_range(-5,5);

coldButton = summonObject(obj_fridgeButton, [["isCold", true], ["parent", id], ["depth", depth-1], ["x", x], ["y", y]]);
hotButton = summonObject(obj_fridgeButton, [["isCold", false], ["parent", id], ["depth", depth-1], ["x", x], ["y", y]]);

function changeTemp(increase){
	if increase{
		if temperatureDifference < temperatureLimits[1]{
			temperatureDifference++;
		}
	}else{
		if temperatureDifference > temperatureLimits[0]{
			temperatureDifference--;
		}
	}
}

function updateTemps(){
	for (var i = 0; i < ds_list_size(hitboxList); i++){
		var hitbox = ds_list_find_value(hitboxList,i);
		hitbox.temperature = hitbox.defaultTemp + temperatureDifference;
	}
}