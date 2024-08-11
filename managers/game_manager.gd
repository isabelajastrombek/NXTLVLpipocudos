extends Node

#region Enums
#endregion

#region Parameters (consts and exportvars)
#endregion

#region Signals
signal items_changed(items : Array[Item])
#endregion

#region Variables
var items : Array[Item] = []
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
func add_item(item:Item):
	items.append(item)
	items_changed.emit(items)
	
func find_key_item_index(key:String) -> int:
	for i in range(items.size()):
		var item := items[i]
		if item.key == key:
			return i
	return -1
	
func has_item_with_key(key:String) -> bool:
	return find_key_item_index(key) != -1
	
func remove_item_with_key(key:String):
	if !has_item_with_key(key):
		return
	items.remove_at(find_key_item_index(key))
	items_changed.emit(items)
	
#endregion

#region Private functions
#endregion

#region Subclasses
#endregion


