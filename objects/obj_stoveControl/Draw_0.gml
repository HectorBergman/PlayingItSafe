draw_self();

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);


if state == 0
{
	print("Stove is turned off");
}
else if state == 1
{
	print("Stove is on low setting");
}
else if state == 2
{
	print("Stove is on medium setting");
}
else if state == 3
{
	print("Stove is on high setting");
}
else
{
	print("Something has gone wrong, this should not happen");
}