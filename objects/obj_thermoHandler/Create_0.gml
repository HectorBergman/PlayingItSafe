
movableThermo = false;

if miniHand.difficulty >= 4
{
	movableThermo = true;
}


if !movableThermo{
instance_create_layer(1375, 320, "SpawnTemp", obj_thermo);
} else {
instance_create_layer(625, 275, "SpawnTemp", obj_thermo);
}