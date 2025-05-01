

enum shelves{
	topShelf,
	midShelf,
	botShelf,
	outside,
}

fishStruct = createFoodItemStruct("Fisk", spr_fish, -20, 4, shelves.midShelf);
milkStruct = createFoodItemStruct("Mjölk", spr_milk, 0, 8, shelves.topShelf);
lunchBoxStruct = createFoodItemStruct("Matlåda", spr_foodbox, 0, 8, shelves.topShelf);
bananaStruct = createFoodItemStruct("Banan", spr_bananas, 10, 25, shelves.outside);
mincedMeatStruct = createFoodItemStruct("Köttfärs", spr_malet, -20, 4, shelves.midShelf);
breadStruct = createFoodItemStruct("Bröd", spr_bread, 10, 25, shelves.outside);
carrotStruct = createFoodItemStruct("Morot", spr_dndCarrot, 0, 5, shelves.botShelf);


function createFoodItemStruct(name, sprite, lowestTemp, highestTemp, bestShelf){
	return {
		_name : name,
		sprite : sprite,
		lowestTemperature : lowestTemp,
		highestTemperature : highestTemp,
		bestShelf : bestShelf,
	}
}


itemInfoArray = [mincedMeatStruct, fishStruct, milkStruct, lunchBoxStruct, bananaStruct, breadStruct, carrotStruct, noone];




