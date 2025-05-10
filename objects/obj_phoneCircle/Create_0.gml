

//Create a dialogue array for your minigame and the tutorialYapper and tutorialHandler will scroll through it for
//each step if the handler is set up properly, see examples below on how to set up the dialogueArray for your minigame

//Very short text: no overcomplications. Just explain the basics quickly.

enum circleStates {
	init,
	invisible,
	startExpand,
	expanding,
	startContract,
	contracting,
	donezo,
}

tween = noone;
circleState = circleStates.init;
circleScale = 0;
image_xscale = circleScale
image_yscale = circleScale;
baseX = x
baseY = y
hitboxX = x*room_width/1920
hitboxY = y*room_height/1080
baseBBox = [bbox_left,bbox_right,bbox_top,bbox_bottom];

phone = summonObject(obj_phone, [["x", 200], ["y", 0], ["depth", depth-1], ["parent", id]])



