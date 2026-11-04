class_name Ball
extends CharacterBody2D

@export var radius: float = 6.0:
	set(value):
		# Plain `radius`, not `self.radius`: Godot makes `self.radius` a compile error inside its own setter.
		radius = value
		self._apply_radius()
@export var speed: float = 200.0
@export var color: Color = Color.WHITE:
	set(value):
		color = value
		self.queue_redraw()

@onready var _shape: CollisionShape2D = $CollisionShape2D


func _ready() -> void:
	self._apply_radius()


func serve() -> void:
	# Down at 45°, left or right on a coin flip (randf() is 0 to 1).
	var x: float = -1.0 if randf() < 0.5 else 1.0
	# normalized() makes the direction length 1, so speed sets the length.
	self.velocity = Vector2(x, 1.0).normalized() * self.speed


func _physics_process(delta_sec: float) -> void:
	# move_and_collide takes this frame's distance, not a speed, so we multiply by delta_sec here.
	var collision: KinematicCollision2D = self.move_and_collide(self.velocity * delta_sec)
	if collision:
		self.velocity = self.velocity.bounce(collision.get_normal())


func _draw() -> void:
	# Drawn around the node's origin, so the circle is centred on the ball's position.
	self.draw_circle(Vector2.ZERO, self.radius, self.color)


func _apply_radius() -> void:
	# The setter can run before the child nodes exist (while the scene loads).
	if not self.is_node_ready():
		return
	(self._shape.shape as CircleShape2D).radius = self.radius
	self.queue_redraw()
