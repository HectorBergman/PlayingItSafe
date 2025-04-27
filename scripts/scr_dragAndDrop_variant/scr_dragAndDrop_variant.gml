function minigame_dragAndDrop_variant_control(){
	switch (minigameStatus){
		case status.started: minigame_dragAndDrop_variant_create(); break;
		case status.ongoing: minigame_dragAndDrop_variant_step(); break;
		case status.finished: minigame_dragAndDrop_variant_finish(); break;
		case status.none: break;
	}
}

function minigame_dragAndDrop_variant_create(){
	var highestI = 0;
	for (var i = 0; i < difficulty; i++){
		itemsArray[i] = summonDnDItem(i);
		highestI = i;
	}

	itemsArray[highestI + 1] = noone; //lazy crash prevention for for-loops
	
	minigameStatus = status.ongoing;
}


function minigame_dragAndDrop_variant_step(){
}


function minigame_dragAndDrop_variant_finish(){
	perfect = true;
	if checkmark == noone{
		var pointsEarned = 0;
		var itemPoints = 0;
		for (var i = 0; itemsArray[i] != noone; i++;) {
			print(itemsArray[i].winValue);
			if !(itemsArray[i].winValue == winValues.noWin || itemsArray[i].winValue == winValues.tooHot){ 
				if itemsArray[i].winValue == winValues.tooCold{
					//having items stored too cold can be bad for food quality,
					//but generally not harmful, so award points for staying safe,
					//but not as much as having a perfect temperature.
					itemPoints = 10;
					pointsEarned += itemPoints
					perfect = false;
					summonItemText(itemsArray[i],"$eece5d",itemPoints);
				}else{
					print("hejsan");
					itemPoints = 30;
					pointsEarned += itemPoints
					summonItemText(itemsArray[i],"$bed6ae",itemPoints);
				}

			}else{//storing food at too high temperatures should be more punishing
				  //than storing them at correct temperatures is rewarding
				itemPoints = -60
				pointsEarned += itemPoints;
				summonItemText(itemsArray[i],"$9c0000",itemPoints);
				perfect = false;
			}
		}
		scoreHand.totalScore += pointsEarned
		
		
		checkmark = summonObject(obj_correct, [[]]);
		if !perfect{
			checkmark.visible = false;
		}
	}else{
		if checkmark.life == checkmark.lifeTime{
			exitMinigame();
			miniHandRefresh();
		}
	}

}


function summonItemText(item, color, points){
	summonObject(obj_itemFinisherText, [["x", item.x+item.sprite_width/2],["y", item.y-item.sprite_height/2],["color", color],["points", points]])
}

function summonDnDItem(index){
	var randomInt = irandom_range(0,2)
	var lowestTemp = 0;
	var highestTemp = 0;
	var sprite = noone;
	//todo: change numbers
	if randomInt == 0{
		sprite = spr_fish
		lowestTemp = -20;
		highestTemp = 4;
	}else if randomInt == 1{
		lowestTemp = 5;
		highestTemp = 7;
		sprite = spr_milk
	}else if randomInt == 2{
		lowestTemp = 4;
		highestTemp = 6;
		sprite = spr_foodbox
	}
	return summonObject(obj_dragAndDrop_item_vari, [["x", index*60], ["y", 318], ["lowestTemperature", lowestTemp],
	["highestTemperature", highestTemp], ["sprite", sprite]]);
}