class_name Paddle
extends CharacterBody2D

@export var size: Vector2 = Vector2(140.0, 20.0):
	set(value):
		# Plain `size`, not `self.size`: Godot makes `self.size` a compile error inside its own setter.
		size = value
		self._apply_size()
@export var speed: float = 800.0

@onready var _shape: CollisionShape2D = $CollisionShape2D
@onready var _visual: ColorRect = $ColorRect


func _ready() -> void:
	self._apply_size()


func _physics_process(_delta_sec: float) -> void:
	var direction: float = Input.get_axis("paddle_left", "paddle_right")
	self.velocity.x = direction * self.speed
	self.move_and_slide()

	var half_width: float = self.size.x / 2.0
	self.position.x = clampf(self.position.x, half_width, self.get_viewport_rect().size.x - half_width)


func _apply_size() -> void:
	# The setter can run before the child nodes exist (while the scene loads).
	if not self.is_node_ready():
		return
	(self._shape.shape as RectangleShape2D).size = self.size
	self._visual.size = self.size
	self._visual.position = -self.size / 2.0
