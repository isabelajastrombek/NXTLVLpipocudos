extends Sprite2D
class_name ClickableController

#region Enums
#endregion

#region Parameters (consts and exportvars)
@export var outline_shader_material : ShaderMaterial
#endregion

#region Signals
#endregion

#region Variables
@onready var clickable_area : Area2D = %ClickableArea
#endregion

#region Computed properties
#endregion

#region Event functions
func _init():
	pass
	
func _enter_tree():
	pass
	
func _ready():
	clickable_area.input_event.connect(_area_input_event)
	clickable_area.mouse_entered.connect(_area_mouse_entered)
	clickable_area.mouse_exited.connect(_area_mouse_exited)
	
func _process(_delta):
	pass
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
#endregion

#region Private functions
func _area_input_event(viewport: Node, event: InputEvent, shape_idx: int):
	if event.is_action_pressed("click_left"):
		pass

func _area_mouse_entered():
	material = outline_shader_material
	
func _area_mouse_exited():
	material = null
#endregion

#region Subclasses
#endregion


