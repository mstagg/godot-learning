# Godot Resources

## Knowledge

- [Godot Docs: Step by step](https://docs.godotengine.org/en/stable/getting_started/step_by_step/index.html)
  Official intro to nodes, scenes, scripting and signals. Use for: the core mental model and first lessons.
- [Godot Docs: GDScript reference](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_basics.html)
  Official language reference. Use for: syntax, typing, lambdas, exports; also to review agent-written code.
- [Godot Docs: GDScript style guide](https://docs.godotengine.org/en/stable/tutorials/scripting/gdscript/gdscript_styleguide.html)
  Official conventions. Use for: writing agent rules files and reviewing generated code.
- [Godot Docs: Introduction](https://docs.godotengine.org/en/stable/about/introduction.html)
  Entry point to the manual. Use for: finding the right section of the docs.
- [Godot Docs: Your first 2D game](https://docs.godotengine.org/en/stable/getting_started/first_2d_game/index.html)
  Official "Dodge the Creeps" tutorial for 4.7. Use for: a second take on player movement, scenes, HUD, and spawning.
- [Godot Docs: Physics introduction](https://docs.godotengine.org/en/stable/tutorials/physics/physics_introduction.html)
  The four collision object types and when to use each. Use for: picking body types, move_and_slide vs move_and_collide.
- [Godot Docs: Input examples](https://docs.godotengine.org/en/stable/tutorials/inputs/input_examples.html)
  Input Map, actions, polling vs events. Use for: anything input or controller related.
- [Godot Docs: Command line tutorial](https://docs.godotengine.org/en/stable/tutorials/editor/command_line_tutorial.html)
  CLI flags (--headless, --import, --quit-after, -e). Use for: agent smoke tests and CI. Unknown flags are silently ignored.
- [Godot download archive](https://godotengine.org/download/archive/)
  Authoritative list of releases. Use for: confirming the current stable (4.7.2 as of 2026-10-20) and 4.8 beta status.

### Free art assets

- [Kenney](https://kenney.nl/assets)
  Large library of consistent-style 2D/3D/UI/audio packs, all CC0 (no attribution, commercial OK). Use for: placeholder and shippable art for every clone; first stop.
- [OpenGameArt.org](https://opengameart.org/)
  Community library restricted to CC0, CC-BY, CC-BY-SA, OGA-BY and GPL. Use for: assets Kenney lacks. Check the licence on each submission page (uploads can be mislabelled), and record the source and credit line.

### Making art (pixel art)

- [Lospec: Pixel Art, Where to Start](https://lospec.com/pixel-art-where-to-start)
  Curated beginner path. Use for: the first art lessons.
- [Lospec tutorial database](https://lospec.com/pixel-art-tutorials/tags/beginner)
  Searchable index of pixel-art tutorials (e.g. Michael Azzi's *Pixel Logic*). Use for: specific techniques (outlines, shading, animation).
- [Lospec palette list](https://lospec.com/palette-list)
  Downloadable palettes (NES, Game Boy, PICO-8, DawnBringer 32, etc.). Use for: picking a constrained palette per clone.
- Editors: [Aseprite](https://www.aseprite.org/) (paid, ~$20, the standard: animation, sprite-sheet export, Lua) or [Pixelorama](https://pixelorama.org/) (free/MIT, built in Godot, exports Godot TileSets). Use for: all sprite work. Decide at the first art lesson.

## Wisdom (Communities)

None. The learner has opted out of communities for now; do not propose them.

## Gaps

- Best practices section of the *stable* docs (project architecture: scenes vs scripts, autoloads, interfaces); only found the 3.1 version, so the 4.x URL still needs locating.
- Spec-driven / agentic development with Godot (agent rules, testing GDScript e.g. GUT/gdUnit4, running the editor headless): no vetted source yet.
- Steam Deck / Linux export and Steamworks integration (e.g. GodotSteam): no vetted source yet.
- Tactics/strategy game design and architecture references (Ogre Battle-style real-time-with-pause combat).
