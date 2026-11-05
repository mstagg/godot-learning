# 0013 · Score
Goal: Breaking bricks earns points, and the score in the info column counts up.
Behaviour:
- Brick has signal destroyed(points: int) and @export var points = 10; hit() emits it, then queue_free().
- game_window.gd connects each brick's destroyed as it builds it, and re-emits its own signal points_scored(points: int).
- New game.gd on the root owns var _score_total: int, connects PlayArea.points_scored and adds the points.
- _score_total has a setter that calls GameStateWindow.set_score(), so every change shows immediately; _ready sets it to 0.
- New game_state_window.gd has set_score(score: int), which shows the score zero-padded to 5 digits ("00010").
- A miss keeps the score; only the bricks rebuild.
Done when:
- The score shows 00000 at start.
- Each broken brick adds 10: the first one shows 00010.
- After a miss, the bricks come back and the score keeps its value.
- Breaking more bricks keeps adding from there.
Not in this spec:
- Different points per brick or per row
- High score or saving
- Lives or game over
- Level logic
- Capping or shrinking scores over 99999
- Sounds or effects on scoring
