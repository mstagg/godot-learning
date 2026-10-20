# 0002 · Paddle physics body
Goal: The paddle plays exactly as before, but is a physics body so a ball can collide with it later.
Behaviour:
- Paddle root becomes a CharacterBody2D with a CollisionShape2D matching the paddle size.
- Movement uses velocity and move_and_slide() in _physics_process, at the same speed, with the same instant stop.
- Paddle still cannot move vertically and still stops at both screen edges (keep the existing clamp).
- Size and speed stay in PaddleConfig; the collision shape size comes from it too.
Done when:
- The paddle looks and feels the same as spec 0001, and stops at both edges.
Not in this spec:
- Any ball
- Wall colliders (the screen-edge clamp stays)
- Collision layers and masks
- Editor-editable config
