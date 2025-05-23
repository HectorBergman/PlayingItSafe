PAUSE
if area != -1 && dndHand.shelfLimit{
	maxHolding = miniHand.shelfItemsAmount[area];
}


for (var i = 0; i < ds_list_size(holdingList); i++){
	var val = ds_list_find_value(holdingList,i);
	if !place_meeting(x,y,val){
		ds_list_delete(holdingList,i);
		holding--;
	}
}
switch (textState){
	case textStates.normal:{}break;
	case textStates.angryStart:{/*play sound here*/
		textState = textStates.angry;}break;
	case textStates.angry:{angryTimer++
		if angryTimer == angryTime{
			angryTimer = 0;
			textState = textStates.normal;
		}
	}break;
}