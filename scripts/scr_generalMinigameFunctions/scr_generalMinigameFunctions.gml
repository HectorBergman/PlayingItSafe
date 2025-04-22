

function exitMinigame(){
	scoreHand.totalScore += scoreHand.currentScore;
	scoreHand.currentScore = 0;
	minigameStatus = status.started;
	currentMinigame = minigame.none;
	room_goto(rm_kitchen);
}