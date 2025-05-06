

function exitMinigame(){
	scoreHand.totalScore += scoreHand.currentScore;
	scoreHand.currentScore = 0;
	minigameStatus = status.started;
	lastMinigame = currentMinigame;
	currentMinigame = minigame.kitchen;
	room_goto(rm_kitchen);
}