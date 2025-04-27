enum noteStates{
	normal,
	reading,
}
stateOfNote = noteStates.normal;


panner = noone;
pointer = noone;
cam = noone;

originCoords = [x,y];
hoveredCoords = [x+64,y];

pannerIsHovered = false;
