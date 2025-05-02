dndHand = instance_find(obj_dndHandler, 0);

if !dndHand.shelfLimit{
	maxHolding = 999;
}
if dndHand.thermometer{
	
	temperature += random_range(-0.3,0.3);
}else if area != -1{
	defaultTemp = 4;
	temperature = 4
}