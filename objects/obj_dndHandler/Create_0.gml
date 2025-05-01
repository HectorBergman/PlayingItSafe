shelfLimit = false;
thermometer = false;
changeableTemperature = false;

if miniHand.difficulty >= 4{
	thermometer = true;
}
if miniHand.difficulty >= 8{
	shelfLimit = true;
}
if miniHand.difficulty >= 12{
	changeableTemperature = true;
}