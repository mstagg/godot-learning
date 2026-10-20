# 0001 · Initial Paddle

Goal: Moveable paddle for breakoutgame on screen. Moveable by user

Behaviour:
- Paddle is a wide flat rectangle near the bottom, centred at start.
- Left/right arrows (and A/D) move it at 600 px/s, release stops it instantly.
- Paddle cannot move up and down
- Paddle cannot leave the screen, the left and right screen edges are the bounds of the allowed area
- Paddle is configuration-driven such that speed and size are centrally defined and can be tweaked by me ad-hoc in source code

Done when:
- Running the project shows the paddle; holding each key moves it; it stops at both edges.

Not in this spec:
- Any physics work
- Any ball or target block work
- Any Powerups
- Any menu
- Any score display