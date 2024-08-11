extends Node2D
class_name MainSceneController

#region Enums
#endregion

#region Parameters (consts and exportvars)
#endregion

#region Signals
#endregion

#region Variables
@onready var camera : Camera2D = %Camera
@onready var player : PlayerController = %Player
var current_screen : ScreenController
var screens : Array[ScreenController] = []
#endregion

#region Computed properties
#endregion

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	#player.moved.connect(_on_player_moved)
	_setup_screen_controllers()
	_set_screen(0)
	pass
	
func _process(_delta):
	pass
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
#endregion

#region Private functions	
func _change_camera_limits(left:int,right:int):
	var tween := get_tree().create_tween().set_trans(Tween.TRANS_SINE)
	tween.tween_property(camera,"limit_left",left,1.0)
	tween.parallel().tween_property(camera,"limit_right",right,1.0)
	
func _find_screen_index(name:String) -> int:
	for i in range(screens.size()):
		if screens[i].name == name:
			return i
	return -1
	
func _setup_screen_controllers():
	screens.assign(%Screens.get_children())
	for screen : ScreenController in screens:
		screen.moved_to_screen.connect(_set_screen_with_name)
	
func _set_screen(index:int):
	# If index doesn`t exist, return
	if index >= screens.size() or index < 0:
		return
	current_screen = screens[index] 
	var screen_pos = current_screen.position
	_change_camera_limits(screen_pos.x,screen_pos.x+current_screen.width)
	
func _set_screen_with_name(name:String):
	_set_screen(_find_screen_index(name))
	
#func _on_player_moved(target:Vector2):
	#print("Movendo camera!")
	#camera.position = target
#endregion

#region Subclasses
#endregion

