# 0019 · Paddle aiming
Goal: Moving the paddle when I launch or return the ball bends its direction, so I can aim.
Behaviour:
- paddle.gd gets aim(ball_direction: Vector2, surface_normal: Vector2) -> Vector2: add (get_real_velocity() / speed) * paddle_influence to ball_direction, normalize, then cap it to within max_angle_deg of surface_normal.
- New paddle exports: paddle_influence: float = 0.5, max_angle_deg: float = 60.0.
- Launch: the paddle calls _held_ball.launch(self.aim(Vector2.UP, Vector2.UP)).
- Paddle hit: the ball bounces as now, then sets its direction to paddle.aim(bounced direction, collision normal), then adds the 0014 speed-up.
- Walls and bricks bounce as before.
Done when:
- Launching with the paddle still goes straight up; launching while moving leans the same way (Remote: about (145, -291) moving right at full speed).
- A still paddle returns the ball at its mirror angle, as before.
- Moving with the ball at impact flattens its return; moving against it steepens it.
- No paddle return is ever flatter than 60° from vertical (in Remote, |x| ≤ 1.73 × |y|).
- Clipping the paddle's end on a miss doesn't save the ball.
- Pushing against a wall while hitting gives the same angle as standing still.
Not in this spec:
- Aiming by where the ball hits the paddle
- An aim indicator or trajectory preview
- Sounds
- Changes to the speed-up rule
- A forced minimum angle off vertical
