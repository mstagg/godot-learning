# 0007 · Drain
Goal: When I miss the ball, the game resets and I play again.
Behaviour:
- Drain is an Area2D, its own scene (drain.tscn / drain.gd), instanced in main.
- It is an invisible strip covering the bottom 10px of the screen, full width, placed by main.gd like the walls.
- It is on a new collision layer 4 "drain", and its Mask has only "ball" ticked.
- When the ball enters, the drain emits its own signal ball_drained; it does not reset anything itself.
- main connects to ball_drained and calls reset_game() immediately, with no pause.
Done when:
- When I miss, the game instantly resets: ball at the centre moving down at 45°, paddle centred.
- It works every time I miss, not only the first time.
- With Debug > Visible Collision Shapes on, I can see the drain strip along the bottom edge.
Not in this spec:
- Lives or game over
- Score
- A pause or "press to serve" before the ball moves again
- A restart key
- Sound or effects on a miss
