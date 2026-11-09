# 0022 · Game state machine
Goal: The game knows whether I'm playing or have lost, and which level I'm on, while still playing exactly as before.
Behaviour:
- game.gd gets enum State { PLAYING, GAME_OVER } and _state, which starts as PLAYING; every change goes through _set_state(new_state).
- Last miss (ball lost at 0 lives): _set_state(GAME_OVER), reset_game(), _set_state(PLAYING). The "Game over, for now" comment goes.
- game.gd owns _level (@export var starting_level: int = 1); its setter calls GameStateWindow.set_level(), like _score_total and _lives, and LevelLabel reads "Level %d".
- reset_game() also sets _level back to starting_level.
Done when:
- LevelLabel shows "Level 1"; with starting_level set to 2 in the Inspector it shows "Level 2".
- A breakpoint in _set_state() stops twice on the third miss: new_state GAME_OVER, then PLAYING.
- Otherwise it plays as before: the third miss gives 00000, "Extra Lives: 2" and a full wall.
Not in this spec:
- Pausing
- The game over overlay
- Space to restart
- Level clear and more levels
- Hold to restart
- State logging
