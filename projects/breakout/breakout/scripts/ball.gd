class_name Ball
extends CharacterBody2D

@export var radius: float = 9.0:
	set(value):
		# Plain `radius`, not `self.radius`: Godot makes `self.radius` a compile error inside its own setter.
		radius = value
		self._apply_radius()
@export var speed: float = 325.0
@export var speed_increase: float = 20.0
@export var max_speed: float = 600.0

@onready var _shape: CollisionShape2D = $CollisionShape2D


func _ready() -> void:
	self._apply_radius()


func pause_physics() -> void:
	# Stops _physics_process, so the ball never calls move_and_collide; something else must move it.
	self.set_physics_process(false)


func launch(direction: Vector2) -> void:
	# normalized() makes the direction length 1, so speed sets the length.
	self.velocity = direction.normalized() * self.speed
	self.set_physics_process(true)


func _physics_process(delta_sec: float) -> void:
	# move_and_collide takes this frame's distance, not a speed, so we multiply by delta_sec here.
	var collision: KinematicCollision2D = self.move_and_collide(self.velocity * delta_sec)
	if collision:
		self.velocity = self.velocity.bounce(collision.get_normal())
		var brick: Brick = collision.get_collider() as Brick
		if brick:
			brick.hit()
		var paddle: Paddle = collision.get_collider() as Paddle
		if paddle:
			# The paddle bends the bounce, then the ball gets a little faster, never past max_speed.
			var new_speed: float = minf(self.velocity.length() + self.speed_increase, self.max_speed)
			self.velocity = paddle.aim(self.velocity, collision.get_normal()) * new_speed


func _apply_radius() -> void:
	# The setter can run before the child nodes exist (while the scene loads).
	if not self.is_node_ready():
		return
	(self._shape.shape as CircleShape2D).radius = self.radius
