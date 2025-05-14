
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text(room_width / 2, room_height / 2, "Game Over!\nPress R to Restart");
// Display the score at the top-left corner of the screen
draw_text(room_width / 2, room_height/2 + 50, 
"Poäng: " + string(global.drop_score) + " of max " + string(global.drop_interval - 1));

// TODO: fler options