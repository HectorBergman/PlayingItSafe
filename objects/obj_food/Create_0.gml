// Initialization statements
depth = 0
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

tweenTick = 0;
tweenTickTime = 10;


smoothingFactorHeating = 0.002; //for the temp approaching goaltemp
smoothingFactorCooling = 0.00075;
smoothingFactor = smoothingFactorHeating;

tempRange = [20,100];
stateAge = [100,350,1100];


goalTemp = mapRange(obj_stoveControl.image_angle, 120,-120,tempRange[0],tempRange[1]);
temp = 20;





// Checks when done, if time has swapped
after_done_counter = 0;
after_done_timer = 100;