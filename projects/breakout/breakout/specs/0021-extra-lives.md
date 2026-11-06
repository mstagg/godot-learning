# 0021 · Extra lives
Goal: I get three balls; a miss costs an extra life instead of rebuilding the wall, and the column shows how many are left.
Behaviour:
- game.gd owns _lives (@export var starting_lives: int = 2); its setter calls GameStateWindow.set_lives(), like _score_total.
- New LivesLabel directly under ScoreLabel, font size 17, plain: "Extra Lives: 2".
- The drain still emits ball_drained; game_window.gd forwards it, deferred, as signal ball_lost.
- game_window.gd's reset_game() splits: reset_ball_and_paddle() centres the paddle and calls hold_ball(ball); build_level() rebuilds the bricks, then calls reset_ball_and_paddle().
- On ball_lost with lives above 0: lives - 1, then the play area's reset_ball_and_paddle(); broken bricks stay broken.
- On ball_lost at 0 lives (game over, for now): game.gd's new reset_game() sets score 0 and lives to starting_lives, then calls the play area's build_level().
Done when:
- "Extra Lives: 2" shows under the score at start.
- Misses take it 2 → 1 → 0, each time with the ball back on the paddle and broken bricks still gone.
- The next miss resets the game: it looks exactly like a fresh start.
Not in this spec:
- A real game-over screen or pause
- Level clear
- Ball icons instead of a number
- Extra lives from score
- Sounds
