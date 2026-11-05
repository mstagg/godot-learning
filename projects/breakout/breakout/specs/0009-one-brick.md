# 0009 · One brick
Goal: A single brick the ball breaks, so I can check the hit behaviour before bricks are generated.
Behaviour:
- Brick is a StaticBody2D with a yellow ColorRect, 80x24, its own scene (brick.tscn / brick.gd, class_name Brick), instanced in game.
- game.gd centres it horizontally with its top edge at brick_top_margin (@export, 280 for now, on the ball's early path); size is an @export var.
- Brick is on a new collision layer 5 "bricks" with an empty Mask; the ball's Mask adds "bricks".
- The ball bounces off it like a wall, then calls hit() if the collider is a Brick.
- hit() removes the brick with queue_free(); the brick emits nothing.
- reset_game() does not bring the brick back (it is gone until I re-run).
Done when:
- The brick shows centred, partway down the screen.
- The ball bounces off it, and the brick disappears on the first hit.
- In Scene → Remote, the Brick node is gone after the hit, and stays gone after a miss.
Not in this spec:
- More bricks, a grid, or creating bricks from code
- Signals or score
- Groups
- Multi-hit bricks
- Rebuilding bricks on reset
- Aimed paddle bounce
