extends CharacterBody2D
class_name PlayerController

var speed = 300
var click_position = Vector2()
var target_position = Vector2()

func _ready():
	click_position = position
	DialogueManager.set_player_controller(self)

func _physics_process(_delta):
	if !DialogueManager.is_dialogue_active and Input.is_action_pressed("click_left"):
		click_position = get_global_mouse_position() 
	_move_to_target()

func _move_to_target():
	if position.distance_to(click_position) > 3:
		target_position = (click_position - position).normalized()
		velocity = target_position * speed
		move_and_slide() 
