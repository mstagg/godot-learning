extends Node2D

@export var paddle_bottom_margin: float = 40.0

@onready var _paddle: Node2D = $Paddle


func _ready() -> void:
	var screen_size: Vector2 = self.get_viewport_rect().size
	self._paddle.position = Vector2(screen_size.x / 2.0, screen_size.y - self.paddle_bottom_margin)
