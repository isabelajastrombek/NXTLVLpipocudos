extends Node2D
class_name ScreenController

#region Enums
#endregion

#region Parameters (consts and exportvars)
@export var width : int
#endregion

#region Signals
signal moved_to_screen(name:String)
#endregion

#region Variables
#endregion

#region Computed properties
#endregion

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	_configure_areas()
	
func _process(_delta):
	pass
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
func enter_screen():
	pass
#endregion

#region Private functions
func _configure_areas():
	var areas : Array[Area2D]
	areas.assign(%ChangeScreenAreas.get_children())
	for area in areas:
		area.body_entered.connect(func(_body): moved_to_screen.emit(area.name))
#endregion

#region Subclasses
#endregion

