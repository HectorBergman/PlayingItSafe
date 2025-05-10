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
	for (var i = 0; i < floor(difficulty/2)+2; i++){
		itemsArray[i] = summonDnDItem(i);
		highestI = i;
	}
	for (var i = 0; i < instance_number(obj_clearCheckHitbox_variant); i++){
		var hitbox = instance_find(obj_clearCheckHitbox_variant, i);
		
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
					tooColdAmnt++;
					perfect = false;
					summonItemText(itemsArray[i],"$b0c5ff",itemPoints);
				}else{
					justRightAmnt++;
					itemPoints = 20;
					pointsEarned += itemPoints
					summonItemText(itemsArray[i],"$61cc14",itemPoints);
				}

			}else{//storing food at too high temperatures should be more punishing
					//than storing them at correct temperatures is rewarding
				tooHotAmnt++;
				itemPoints = -50
				pointsEarned += itemPoints;
				summonItemText(itemsArray[i],"$9c0000",itemPoints);
				perfect = false;
			}
			scoreHand.totalScore += pointsEarned
			dragAndDropIndexer++;
	
		}
		dragAndDropAnimationTimer++;
	
	}else{
		dragAndDropAnimationTimer++
		if dragAndDropAnimationTimer > dragAndDropAnimationDelay{
			if checkmark == noone{
				var note = instance_find(obj_note,0);
				dndRead = note.ownDndRead;
				checkmark = summonObject(obj_correct, [[]]);
				if !perfect{
					checkmark.visible = false;
					ds_list_find_value(mainGameHand.stationsAndAlerts,mainGameHand.activeIndex).stationInfostruct.difficulty += 2;
				}else{
					ds_list_find_value(mainGameHand.stationsAndAlerts,mainGameHand.activeIndex).stationInfostruct.difficulty += 4;
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
	var randomInt = irandom_range(0,6)
	var itemHandler = instance_find(obj_itemHandler, 0);
	//todo: change numbers
	var name = itemHandler.itemInfoArray[randomInt]._name
	var sprite = itemHandler.itemInfoArray[randomInt].sprite
	var lowestTemp = itemHandler.itemInfoArray[randomInt].lowestTemperature
	var highestTemp = itemHandler.itemInfoArray[randomInt].highestTemperature
	var itemIndex = randomInt;
	
	var randomX = irandom_range(120,290);
	var randomY = irandom_range(128,450);
	
	var shelf = itemHandler.itemInfoArray[randomInt].bestShelf;
	if shelf != 3{
		if shelf == 0{
			if irandom_range(0,2) == 2{
				shelfItemsAmount[shelf+2]++;
			}else{
				shelfItemsAmount[shelf]++;
			}
		}else{
			shelfItemsAmount[shelf]++;
		}
	}
	if irandom_range(0,2) == 2{
		shelfItemsAmount[irandom_range(0,2)]++;
	}

	return summonObject(obj_dragAndDrop_item_vari, [["x", randomX], ["y", randomY], ["lowestTemperature", lowestTemp],
	["highestTemperature", highestTemp], ["sprite", sprite], ["itemIndex", itemIndex], ["_name", name]]);
}