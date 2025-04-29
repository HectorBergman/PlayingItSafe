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
	itemsArrayLength = highestI+1;
	
	minigameStatus = status.ongoing;
}


function minigame_dragAndDrop_variant_step(){
}


function minigame_dragAndDrop_variant_finish(){
	//states would have been good to use here lol
	if dragAndDropIndexer < itemsArrayLength{
		var pointsEarned = 0;
		var itemPoints = 0;
		if dragAndDropAnimationTimer mod dragAndDropAnimationTime == 0{
		
			var i = dragAndDropIndexer;
			if !(itemsArray[i].winValue == winValues.noWin || itemsArray[i].winValue == winValues.tooHot){ 
				if itemsArray[i].winValue == winValues.tooCold{
					//having items stored too cold can be bad for food quality,
					//but generally not harmful, so award points for staying safe,
					//but not as much as having a perfect temperature.
					itemPoints = 10;
					pointsEarned += itemPoints
					perfect = false;
					summonItemText(itemsArray[i],"$b0c5ff",itemPoints);
				}else{
					print("hejsan");
					itemPoints = 20;
					pointsEarned += itemPoints
					summonItemText(itemsArray[i],"$61cc14",itemPoints);
				}

			}else{//storing food at too high temperatures should be more punishing
					//than storing them at correct temperatures is rewarding
				itemPoints = -50
				pointsEarned += itemPoints;
				summonItemText(itemsArray[i],"$9c0000",itemPoints);
				perfect = false;
			}
			scoreHand.totalScore += pointsEarned
			dragAndDropIndexer++;
	
		}
		dragAndDropAnimationTimer++;
		perfect = true;
	
	}else{
		dragAndDropAnimationTimer++
		if dragAndDropAnimationTimer > dragAndDropAnimationDelay{
			if checkmark == noone{
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
	}

}


function summonItemText(item, color, points){
	summonObject(obj_itemFinisherText, [["x", item.x+item.sprite_width/2],["y", item.y-item.sprite_height/2],["color", color],["points", points]])
}

function summonDnDItem(index){
	var randomInt = irandom_range(0,2)
	var itemHandler = instance_find(obj_itemHandler, 0);
	//todo: change numbers
	var name = itemHandler.itemInfoArray[randomInt]._name
	var sprite = itemHandler.itemInfoArray[randomInt].sprite
	var lowestTemp = itemHandler.itemInfoArray[randomInt].lowestTemperature
	var highestTemp = itemHandler.itemInfoArray[randomInt].highestTemperature
	var itemIndex = randomInt;
	
	var randomX = irandom_range(120,290);
	var randomY = irandom_range(128,450);


	return summonObject(obj_dragAndDrop_item_vari, [["x", randomX], ["y", randomY], ["lowestTemperature", lowestTemp],
	["highestTemperature", highestTemp], ["sprite", sprite], ["itemIndex", itemIndex], ["_name", name]]);
}