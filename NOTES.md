# Notes

- Learner is a senior engineer: skip programming basics, don't explain generic OOP/git/testing concepts.
- Agentic-first. Lessons should include spec-writing and agent-review exercises, not just "type this code".
- Art: hand-made or free-licensed, never agent-generated. Include short pixel-art lessons alongside the clones (NES-era clones suit pixel art). Lean on miniature-painting knowledge: value, contrast, highlights and shading transfer; digital tools, palettes, pixel-grid technique and animation are new.
- Time is short and fragmented: keep lessons small.
- No communities: do not propose forums/Discord.
- Spec granularity: one small feature/request per spec. The agent implements in small visible steps so the learner can watch and review every change. No large autonomous runs.
- Toy games are clones of existing games: start NES-style 2D, increase complexity through later eras, move to 3D later.

## Draft clone roadmap (revise as we go)
Each clone is chosen for the engine areas it forces. Order is a draft, not a commitment.

1. Breakout/Arkanoid (NES): scenes, nodes, signals, input, CharacterBody2D/physics bodies, collisions, simple UI score.
2. Galaga/Space Invaders (NES): instancing scenes, spawners, groups, timers, AnimatedSprite2D, audio, game states.
3. Tetris (NES/Game Boy): grid data model separate from rendering, Resources, input repeat, testable pure logic (good first unit tests).
4. Super Mario Bros 1-1 (NES): TileMapLayer, platformer physics, Camera2D, AnimationPlayer, level design.
5. Zelda 1 dungeon (NES): top-down movement, room transitions, autoloads, inventory, save/load.
6. Fire Emblem / Advance Wars map (Famicom/GBA): grid movement, pathfinding (AStarGrid2D), turn state machine, data-driven units. Close to the later project's needs, so it lands once fundamentals are solid.
7. SNES-era JRPG battle/menu screen: Control nodes, themes, focus/gamepad UI navigation, tweens.
8. Steam Deck pass: export one clone to Linux, controller input, Steam Deck resolution.
Art lessons slot in where a clone needs them: Breakout = palette + first sprites; Galaga = sprite animation frames; Mario = tileset; Zelda = top-down walk cycle; JRPG = UI/9-slice. Use Kenney packs as the fallback whenever art would block engine learning.

9. Star Fox rail shooter (SNES): first 3D: Node3D, cameras, meshes, Path3D.
10. Mario 64-style 3D platformer room: CharacterBody3D, third-person camera, lighting, materials/shaders.

## Session log hooks
- Start each new session with 2-3 recall questions from the previous lesson before teaching anything new (spacing).
- Lesson 1 (paddle) written 2026-10-20. Project goes in ~/learning/godot/projects/breakout. When the learner says "project created", write CLAUDE.md (Godot 4.7.2, typed GDScript, style guide, one step at a time, stop after each step, smoke test via `godot --path . --headless --quit-after 60`), create specs/, and init git.
- Lesson 1 complete (2026-10-20). Recall check at start of lesson 2: body type choice needed a correction (CharacterBody2D = code moves it, not "responds to physics"); delta and input-action answers were right.
- Lesson 2 (ball, walls, signals; specs 0004-0006) written 2026-10-20. Next planned: Lesson 3, bricks (instancing, groups, signals for score).
- Lesson 2 complete (2026-11-04) via specs 0004-0008 (learner split drain/reset differently from the lesson's model specs; walls moved off-screen in 0008). Learner now writes specs with the /feature-spec skill.
- Recall check at start of lesson 3: delta answer wrong (thought only the ball "checks for collisions"; real reason is move_and_collide takes a distance, move_and_slide applies delta itself). StaticBody2D-as-drain was "don't know". Signals up / get_parent coupling was right. Revisit delta and body-vs-area in lesson 4's recall.
- Learner wants main renamed to game (planned as spec 0009 in lesson 3). Prefers collision layers described as Inspector boxes, not bitmask numbers. The "Vector2 is an arrow from (0,0)" framing landed well.
- Lesson 3 (bricks, instancing, groups, score; specs 0009-0012) written 2026-11-04. Next planned: Lesson 4, palette + first sprites.
- Lesson 3 complete by 2026-11-05 via specs 0009-0014; the learner went beyond the models (a game window plus a game state column in SubViewports, 5-digit score, ball speed-up). Score flows brick → game_window re-emits → game root.
- Lesson 4 (palette + first sprites; specs 0015-0017) written 2026-11-05. Art scale 2 (1 art px = 2 screen px): ball is a 6x6 Sprite2D, brick and paddle are NinePatchRects, because brick width is computed at runtime. Verified in 4.7.2: the project Default Texture Filter does NOT reach SubViewports, so the play area needs its own Canvas Items filter set to Nearest. The lesson recommends Aseprite over Pixelorama; the learner decides. Spec 0017 has no model and uses an agent spec-review exercise. Lesson 4 opens with recall (delta, Area2D vs StaticBody2D, queue_free timing) as an in-page warm-up. Still ask 2-3 in chat first.
- Next planned: Lesson 5, lives, game over, level clear (game states; sets up Galaga). Candidate later spec: a pixel-art base resolution with integer scaling.
