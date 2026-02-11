class_name CharacterMovement
extends CharacterBody2D

enum TypeEnum {
	PLAYER,
	MONSTER
}

#export properties
@export
var type: TypeEnum
@export
var speed = 300.0

@export
var _jump_velocity = 400.0
@export
var _affected_by_gravity = true
@export
var _gravity_mult_coef = 2

#signal
signal jump_started()

#private attributes
var _direction = Vector2.ZERO
var _jump = false

#public methodes
func move_left() -> void :
	_direction.x = -1

func move_right() -> void :
	_direction.x = 1
	
func move_down() -> void :
	_direction.y = 1
	
func move_up() -> void :
	_direction.y = -1
	
func stop() -> void :
	_direction = Vector2.ZERO

func jump() -> void :
	_jump = true

#private methodes
func _movement_with_gravity(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta * _gravity_mult_coef

	if is_on_floor() and _jump:
		jump_started.emit()
		velocity.y = -_jump_velocity * _gravity_mult_coef
	
	if _direction.x != 0:
		velocity.x = _direction.x * speed
	else :
		velocity.x = move_toward(velocity.x, 0, speed);

func _movement_without_gravity(_delta: float) -> void:
	_direction = _direction.normalized()
	if _direction != Vector2.ZERO:
		velocity = _direction * speed
	else :
		velocity = velocity.move_toward(Vector2.ZERO, speed)
		
	
func _physics_process(delta: float) -> void:
	if _affected_by_gravity:
		_movement_with_gravity(delta)
	else:
		_movement_without_gravity(delta)

	_direction = Vector2.ZERO
	_jump = false

	move_and_slide()
