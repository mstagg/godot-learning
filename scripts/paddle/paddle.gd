extends CharacterBody2D

@onready var _shape: CollisionShape2D = $CollisionShape2D
@onready var _visual: ColorRect = $ColorRect


func _ready() -> void:
	(self._shape.shape as RectangleShape2D).size = PaddleConfig.PADDLE_SIZE
	self._visual.size = PaddleConfig.PADDLE_SIZE
	self._visual.position = -PaddleConfig.PADDLE_SIZE / 2.0


func _physics_process(_delta: float) -> void:
	var direction: float = Input.get_axis("paddle_left", "paddle_right")
	self.velocity.x = direction * PaddleConfig.PADDLE_SPEED
	self.move_and_slide()

	var half_width: float = PaddleConfig.PADDLE_SIZE.x / 2.0
	self.position.x = clampf(self.position.x, half_width, self.get_viewport_rect().size.x - half_width)
