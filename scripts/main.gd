extends Node2D

@onready var _paddle: Node2D = $Paddle


func _ready() -> void:
	var screen_size: Vector2 = get_viewport_rect().size
	_paddle.position = Vector2(screen_size.x / 2.0, screen_size.y - PaddleConfig.PADDLE_BOTTOM_MARGIN)
