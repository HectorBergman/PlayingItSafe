if maxHolding < 100{
	switch (textState){
		case textStates.normal:{drawTextNormal()}break;
		default: {drawTextAngry()}break;
	}
}