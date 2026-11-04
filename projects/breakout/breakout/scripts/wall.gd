extends StaticBody2D

@export var size: Vector2 = Vector2(10.0, 10.0):
	set(value):
		# Plain `size`, not `self.size`: Godot makes `self.size` a compile error inside its own setter.
		size = value
		self._apply_size()

@onready var _shape: CollisionShape2D = $CollisionShape2D
@onready var _visual: ColorRect = $ColorRect


func _ready() -> void:
	self._apply_size()


func _apply_size() -> void:
	# The setter can run before the child nodes exist (while the scene loads).
	if not self.is_node_ready():
		return
	(self._shape.shape as RectangleShape2D).size = self.size
	self._visual.size = self.size
	self._visual.position = -self.size / 2.0
