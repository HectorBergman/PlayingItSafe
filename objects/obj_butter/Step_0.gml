switch (stove.state){
	case stoveState.off:{
		if stateOfStove != stove.state{
			stateOfStove = stove.state;
			tweenHeat(0)
		}
	} break;
	case stoveState.low:{
		if stateOfStove != stove.state{
			stateOfStove = stove.state;
			tweenHeat(33)
		}
	} break;
	case stoveState.medium:{
		if stateOfStove != stove.state{
			stateOfStove = stove.state;
			tweenHeat(67)
		}
	} break;
	case stoveState.high:{
		if stateOfStove != stove.state{
			stateOfStove = stove.state;
			tweenHeat(100)
		}
	} break;
}

sprite_set_speed(sprite_index, baseSpriteSpeed*heat/100, spritespeed_framespersecond);
print(sprite_get_speed(sprite_index));