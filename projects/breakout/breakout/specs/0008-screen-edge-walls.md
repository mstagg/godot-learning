# 0008 · Screen-edge walls
Goal: The play area is the whole screen; the ball bounces off the screen edges, with no red bars.
Behaviour:
- Walls sit just outside the screen, so their inner faces are exactly on the left, right and top edges.
- Walls are invisible: wall.tscn loses its ColorRect, and wall.gd only sizes the collision shape.
- Walls stay 10px thick.
- The paddle code is unchanged; its screen-edge clamp now matches the walls, so it no longer overlaps them.
Done when:
- No red bars are visible.
- The ball visibly touches the left, right and top screen edges when it bounces.
- The paddle stops flush with both side edges.
Not in this spec:
- A drawn border or wall art
- Handling a window resize while playing (walls are placed once at start)
- Moving the drain off-screen
