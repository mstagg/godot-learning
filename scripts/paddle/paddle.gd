extends Node2D

@onready var _visual: ColorRect = $ColorRect


func _ready() -> void:
	_visual.size = PaddleConfig.PADDLE_SIZE
	_visual.position = -PaddleConfig.PADDLE_SIZE / 2.0


func _process(delta: float) -> void:
	var direction: float = Input.get_axis("paddle_left", "paddle_right")
	position.x += direction * PaddleConfig.PADDLE_SPEED * delta

	var half_width: float = PaddleConfig.PADDLE_SIZE.x / 2.0
	position.x = clampf(position.x, half_width, get_viewport_rect().size.x - half_width)
