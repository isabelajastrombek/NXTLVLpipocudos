extends MarginContainer
class_name InventoryItemView

#region Enums
#endregion

#region Parameters (consts and exportvars)
#endregion

#region Signals
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
	pass
	
func _process(_delta):
	pass
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
func setup_item(item:Item):
	await ready
	tooltip_text = "%s\n%s" % [item.name,item.description]
	%ItemTexture.texture = item.texture
	pass
#endregion

#region Private functions
#endregion

#region Subclasses
#endregion


