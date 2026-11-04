extends Node2D

@export var paddle_bottom_margin: float = 40.0
@export var wall_thickness: float = 10.0

@onready var _paddle: Node2D = $Paddle
@onready var _wall_left: StaticBody2D = $WallLeft
@onready var _wall_right: StaticBody2D = $WallRight
@onready var _wall_top: StaticBody2D = $WallTop
@onready var _ball: Ball = $Ball


func _ready() -> void:
	self._place_walls(self.get_viewport_rect().size)
	self.reset_game()


func reset_game() -> void:
	var screen_size: Vector2 = self.get_viewport_rect().size
	self._paddle.position = Vector2(screen_size.x / 2.0, screen_size.y - self.paddle_bottom_margin)
	self._ball.position = screen_size / 2.0
	self._ball.serve()


func _place_walls(screen_size: Vector2) -> void:
	var half: float = self.wall_thickness / 2.0
	self._wall_left.size = Vector2(self.wall_thickness, screen_size.y)
	self._wall_left.position = Vector2(half, screen_size.y / 2.0)
	self._wall_right.size = Vector2(self.wall_thickness, screen_size.y)
	self._wall_right.position = Vector2(screen_size.x - half, screen_size.y / 2.0)
	self._wall_top.size = Vector2(screen_size.x, self.wall_thickness)
	self._wall_top.position = Vector2(screen_size.x / 2.0, half)
