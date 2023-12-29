extends Sprite2D


enum MovementOption {
	DIRECTION_8,
	DIRECTION_4
}

@export var speed : float = 250
@export var movementOption : MovementOption = MovementOption.DIRECTION_8

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match movementOption:
		MovementOption.DIRECTION_8:
			self.global_position += MinoqisUtils.move_8_direction("left", "right", "up", "down", speed) * delta
		MovementOption.DIRECTION_4:
			self.global_position += MinoqisUtils.move_4_direction("left", "right", "up", "down", speed) * delta
