# 0024 · Game over screen
Goal: Losing my last ball freezes the game behind GAME OVER with my score, and Space starts a fresh game.
Behaviour:
- Process Mode: Game root Always, GameWindow Pausable.
- _set_state() pauses the tree and shows GameOverOverlay exactly when the state is GAME_OVER.
- game.gd's _unhandled_input is the only place launch is read, and the state decides what it means: GAME_OVER calls reset_game() then _set_state(PLAYING); PLAYING calls the play area's launch_ball(), which calls the paddle's launch_held_ball() (does nothing if no ball is held). One press, one handler, so the restart press can't also launch the ball.
- The paddle stops polling launch.
- New scripts/game_over_overlay.gd (class_name GameOverOverlay) with set_score(score) for "SCORE %05d"; the _score_total setter updates it alongside the column.
- Last miss: _set_state(GAME_OVER) only.
Done when:
- The third miss freezes everything, the arrows do nothing, and GAME OVER shows over the whole window with my score.
- Space gives 00000, "Extra Lives: 2", Level 1, a full wall and no overlay, with the ball still on the paddle; a second Space launches it.
- Space during play only launches the ball.
Not in this spec:
- Hold to restart
- Title screen
- Pause key
- High scores
- Fade or animation
- Level clear
