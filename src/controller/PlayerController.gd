
class_name PlayerController
extends Node


@export
var _characterMovement: CharacterMovement

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.get_action_raw_strength("jump") :
		_characterMovement.jump()
		
	if Input.get_action_raw_strength("left") :
		_characterMovement.move_left()
		
	if Input.get_action_raw_strength("right") :
		_characterMovement.move_right()
