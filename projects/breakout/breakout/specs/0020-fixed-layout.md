# 0020 · Fixed 1280×800 layout
Goal: The game always lays out at Steam Deck size, so resizing the window only scales the picture.
Behaviour:
- Project Settings → Display → Window: viewport size 1280×800; stretch aspect keep (stretch mode stays canvas_items).
- So the play area is always 1152×800, and each of the 12 bricks is 96 px wide.
- game_window.gd keeps its size_changed handler; it now only fires once, for the startup layout.
Done when:
- The game opens at 1280×800.
- Resizing, maximising or going fullscreen scales the picture with black bars, and doesn't rebuild the wall or move the ball.
- In Scene → Remote, the SubViewport's size is (1152, 800).
Not in this spec:
- Integer scaling for crisp pixels at any window size
- A non-resizable window
- Laying out the remaining bricks again at other sizes
