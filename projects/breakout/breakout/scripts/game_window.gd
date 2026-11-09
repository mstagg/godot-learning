class_name GameWindow
extends Node2D

signal points_scored(points: int)
signal ball_lost
signal level_cleared

@export var paddle_bottom_margin: float = 40.0
@export var wall_thickness: float = 10.0
@export var drain_height: float = 10.0

var _level: Level = null

@onready var _paddle: Paddle = $Paddle
@onready var _wall_left: StaticBody2D = $WallLeft
@onready var _wall_right: StaticBody2D = $WallRight
@onready var _wall_top: StaticBody2D = $WallTop
@onready var _ball: Ball = $Ball
@onready var _drain: Drain = $Drain


func _ready() -> void:
	# Pass the miss up; the game root decides what it means.
	# Deferred: the drain fires during the physics step, and a game over loads a new level, which can't happen mid-step.
	self._drain.ball_drained.connect(self.ball_lost.emit, CONNECT_DEFERRED)
	# Inside a SubViewport the real size only arrives after _ready, so lay out again whenever it changes.
	self.get_viewport().size_changed.connect(self._on_viewport_size_changed)
	self._on_viewport_size_changed()


func _on_viewport_size_changed() -> void:
	var screen_size: Vector2 = self.get_viewport_rect().size
	self._place_walls(screen_size)
	self._place_drain(screen_size)
	self.reset_ball_and_paddle()


# Swaps in a fresh copy of the level scene: unbroken bricks, ball back on the centred paddle.
func load_level(level_scene: PackedScene) -> void:
	if self._level:
		self._level.queue_free()
	self._level = level_scene.instantiate()
	# Pass the level's news up; the game root owns the score and which level comes next.
	self._level.points_scored.connect(self.points_scored.emit)
	self._level.cleared.connect(self.level_cleared.emit)
	self.add_child(self._level)
	self.reset_ball_and_paddle()


func reset_ball_and_paddle() -> void:
	var screen_size: Vector2 = self.get_viewport_rect().size
	self._paddle.position = Vector2(screen_size.x / 2.0, screen_size.y - self.paddle_bottom_margin)
	self._paddle.hold_ball(self._ball)


func launch_ball() -> void:
	self._paddle.launch_held_ball()


func _place_walls(screen_size: Vector2) -> void:
	# Walls sit just outside the screen, so their inner faces are exactly on the screen edges.
	var half: float = self.wall_thickness / 2.0
	self._wall_left.size = Vector2(self.wall_thickness, screen_size.y)
	self._wall_left.position = Vector2(-half, screen_size.y / 2.0)
	self._wall_right.size = Vector2(self.wall_thickness, screen_size.y)
	self._wall_right.position = Vector2(screen_size.x + half, screen_size.y / 2.0)
	self._wall_top.size = Vector2(screen_size.x, self.wall_thickness)
	self._wall_top.position = Vector2(screen_size.x / 2.0, -half)


func _place_drain(screen_size: Vector2) -> void:
	self._drain.size = Vector2(screen_size.x, self.drain_height)
	self._drain.position = Vector2(screen_size.x / 2.0, screen_size.y - self.drain_height / 2.0)


