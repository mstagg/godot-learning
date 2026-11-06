# 0018 · Serve from the paddle
Goal: The ball waits on the centre of my paddle and moves with it until I press Space to launch it.
Behaviour:
- New input action launch: Space and the gamepad's bottom face button (added to project.godot by hand).
- ball.gd: pause_physics() turns off its physics processing; launch(direction: Vector2) sets velocity to direction.normalized() * speed and turns it back on.
- paddle.gd: hold_ball(ball: Ball) keeps a reference in _held_ball (null when empty), calls ball.pause_physics(), and places it at once.
- While holding, after moving and clamping, the paddle sets the ball's global_position to its centre x, its top edge minus the ball's radius.
- On launch, the paddle calls _held_ball.launch(Vector2.UP) and clears _held_ball; launch does nothing when no ball is held.
- reset_game() calls paddle.hold_ball(ball) in place of ball.serve(), so this happens at game start, after every miss and after a resize. serve() and its random direction are removed.
Done when:
- At start and after every miss, the ball sits on the paddle's centre and follows it left and right, including at both walls.
- Space launches it straight up; in Scene → Remote its velocity is (0, -325).
- Space while the ball is in flight does nothing.
- Paddle hits still speed it up, and a miss brings it back to 325.
Not in this spec:
- Aimed release and aimed paddle bounces (next spec)
- Fixing the straight-up loop once a column is cleared (next spec)
- A "Press Space" prompt
- A serve delay or auto-launch
- Lives
