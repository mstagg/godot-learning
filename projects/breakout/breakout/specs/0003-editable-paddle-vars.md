# 0003 · Editable paddle values
Goal: I can tweak the paddle's size and speed in the editor, and change them live while the game runs.
Behaviour:
- Paddle size and speed become @export vars on paddle.gd, with the current values as defaults (140x20, 800 px/s).
- The bottom margin becomes an @export var on main.gd, default 40.
- PaddleConfig is deleted, and paddle.gd moves back to scripts/ (flat layout).
- Changing size in the Inspector, including in the Remote tab of a running game, resizes the visual and the collision shape immediately.
- Changing speed in the Remote tab takes effect on the next physics tick.
Done when:
- With the game running (F5), editing size and speed in Scene > Remote visibly changes the paddle; the same values can be edited in the Inspector before running.
Not in this spec:
- Saving live changes back to the scene (Remote edits are temporary)
- A Resource-based config
- Ball, wall colliders, collision layers
