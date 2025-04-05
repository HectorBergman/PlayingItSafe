itemsArray = [];
var highestI = 0;
for (var i = 0; i < instance_number(obj_dragAndDrop_item); i++) {
    var inst = instance_find(obj_dragAndDrop_item, i);
    itemsArray[i] = inst;
	highestI = i;
}
itemsArray[highestI + 1] = noone; //lazy crash prevention for for-loops

doorsArray = [];
for (var i = 0; i < instance_number(obj_doors); i++) {
    var inst = instance_find(obj_doors, i);
    doorsArray[i] = inst;
	highestI = i;
}
doorsArray[highestI + 1] = noone;

//the above code puts all items and doors into arrays


minigameComplete = false;

checkmark = noone;