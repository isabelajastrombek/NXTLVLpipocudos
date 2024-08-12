extends Node2D
class_name ScreenController

#region Enums
#endregion

#region Parameters (consts and exportvars)
@export var width : int
@export var enter_dialogue_lines : Array[String]
#endregion

#region Signals
signal moved_to_screen(name:String)
#endregion

#region Variables
var clickable_count : int
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
	_desespero()
	
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

func _desespero():
	for clickable : ClickableController in %ClickableSprites.get_children():
		clickable.destroyed.connect(_on_clickable_destroyed)
		clickable_count += 1
	
func _on_clickable_destroyed():
	clickable_count -= 1
	if (clickable_count <= 0):
		DialogueManager.start_dialogue([
			"Ufa!",
			"Acho que isso é tudo que\nconsigo hoje.",
			"Vou é dormir.",
			"Obrigado por jogar! :D"
		])
#endregion

#region Subclasses
#endregion

