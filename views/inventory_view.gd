extends GridContainer
class_name InventoryView

#region Enums
#endregion

#region Parameters (consts and exportvars)
@onready var inventory_item_scn : PackedScene = preload("res://views/inventory_item.tscn")
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
	GameManager.items_changed.connect(_on_items_changed)
	_clear_items()
	hide()
	
func _process(_delta):
	pass
	
func _physics_process(_delta):
	pass
#endregion

#region Public functions
#endregion

#region Private functions
func _clear_items():
	for child in get_children():
		child.queue_free()
	
func _on_items_changed(items:Array[Item]):
	_clear_items()
	visible = items.size() > 0
	for item in items:
		var item_view : InventoryItemView = inventory_item_scn.instantiate()
		item_view.setup_item(item)
		add_child(item_view)
#endregion

#region Subclasses
#endregion


