if (!global.gameEnded) {
    gameTimer -= 1;

    if (gameTimer <= 0) {
        global.gameEnded = true;
        room_goto(rm_ending);
    }
}