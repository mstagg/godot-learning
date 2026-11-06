class_name GameWindow
extends Node2D

signal points_scored(points: int)

const BRICK_SCENE: PackedScene = preload("res://scenes/brick.tscn")

@export var paddle_bottom_margin: float = 40.0
@export var wall_thickness: float = 10.0
@export var drain_height: float = 10.0
@export var brick_rows: int = 3
@export var brick_columns: int = 12
@export var brick_height: float = 24.0
@export var grid_top_margin: float = 48.0

@onready var _paddle: Paddle = $Paddle
@onready var _wall_left: StaticBody2D = $WallLeft
@onready var _wall_right: StaticBody2D = $WallRight
@onready var _wall_top: StaticBody2D = $WallTop
@onready var _ball: Ball = $Ball
@onready var _drain: Drain = $Drain
@onready var _bricks: Node2D = $Bricks


func _ready() -> void:
	# Deferred: the drain fires during the physics step, and new bricks can't be added mid-step.
	self._drain.ball_drained.connect(self.reset_game, CONNECT_DEFERRED)
	# Inside a SubViewport the real size only arrives after _ready, so lay out again whenever it changes.
	self.get_viewport().size_changed.connect(self._on_viewport_size_changed)
	self._on_viewport_size_changed()


func _on_viewport_size_changed() -> void:
	var screen_size: Vector2 = self.get_viewport_rect().size
	self._place_walls(screen_size)
	self._place_drain(screen_size)
	self.reset_game()


func reset_game() -> void:
	var screen_size: Vector2 = self.get_viewport_rect().size
	self._paddle.position = Vector2(screen_size.x / 2.0, screen_size.y - self.paddle_bottom_margin)
	self._paddle.hold_ball(self._ball)
	self._build_bricks(screen_size)


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


func _build_bricks(screen_size: Vector2) -> void:
	# Clear what's left of the old wall first. queue_free() deletes at the end of this frame,
	# so the old and new bricks overlap for one frame while the ball is far away at the centre.
	for old_brick: Node in self._bricks.get_children():
		old_brick.queue_free()

	var brick_size: Vector2 = Vector2(screen_size.x / self.brick_columns, self.brick_height)
	for row: int in self.brick_rows:
		for column: int in self.brick_columns:
			var brick: Brick = BRICK_SCENE.instantiate()
			brick.size = brick_size
			# Positions are centres: the brick's top-left corner plus half a brick.
			brick.position = Vector2(
				column * brick_size.x + brick_size.x / 2.0,
				self.grid_top_margin + row * brick_size.y + brick_size.y / 2.0
			)
			brick.destroyed.connect(self._on_brick_destroyed)
			self._bricks.add_child(brick)


func _on_brick_destroyed(points: int) -> void:
	# Pass the points up; the game root owns the score.
	self.points_scored.emit(points)
