enum noteStates{
	normal,
	reading,
}
stateOfNote = noteStates.normal;


panner = noone;
pointer = noone;
cam = noone;
transitionTimer = 0;
transitionTime = 60;

originCoords = [x,y];
hoveredCoords = [x+64,y];

pannerIsHovered = false;
