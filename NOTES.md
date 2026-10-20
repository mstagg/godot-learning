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
