PAUSE

if interactable && alert == noone{
	alert = summonObject(obj_alert,[["x", x+alertXOffset], ["y", y+alertYOffset], 
									["minigame", minigameRoom], ["minigameEnum", chosenMinigame], ["difficulty", difficulty]]);
}