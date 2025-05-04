// Initialization statements

enum foodState{
	raw,
	partiallyDone,
	done,
	burned,
}
state = foodState.raw;

time = 0;
cook_speed = 0;
age = 0;


smoothingFactorHeating = 0.003; //for the temp approaching goaltemp
smoothingFactorCooling = 0.001;
smoothingFactor = smoothingFactorHeating;

tempRange = [20,100];
stateAge = [100,520,1200];


goalTemp = mapRange(obj_stoveControl.image_angle, 120,-120,tempRange[0],tempRange[1]);
temp = 20;





// Checks when done, if time has swapped
after_done_counter = 0;
after_done_timer = 100;