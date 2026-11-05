# 0011 · Game window and game state window
Goal: The screen splits into a play area on the left 90% and an info column on the right 10%.
Behaviour:
- game.tscn / game.gd (paddle, walls, ball, drain, bricks, reset_game) are renamed to game_window.tscn / game_window.gd, unchanged.
- A new game.tscn is the scene F5 runs: root HBoxContainer filling the screen, no script.
- Its children: GameWindow (SubViewportContainer → SubViewport → game_window instance), stretch ratio 9, and GameStateWindow (game_state_window.tscn), stretch ratio 1.
- Everything in the play area sizes itself from its SubViewport.
- The play area re-places its walls and drain and resets whenever its viewport size changes, because the SubViewport only gets its real size after startup.
- game_state_window.tscn is a near-black ColorRect filling the column, with an empty VBoxContainer for later.
Done when:
- The play area fills the left 90%, and the bricks fill it edge to edge.
- The ball bounces off the play area's right edge, and the paddle stops there.
- The right 10% is a dark, empty column.
- The game otherwise plays exactly as before.
- In Scene → Remote, I can see Game → GameWindow → SubViewport → the play area.
Not in this spec:
- Labels or text in the column
- Score or signals
- Level logic
