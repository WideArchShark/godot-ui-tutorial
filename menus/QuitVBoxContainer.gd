extends VBoxContainer
@onready var top_menu = $"../TopVBoxContainer"

func _on_yes_button_pressed():
	get_tree().quit()

func back():
	self.visible = false
	top_menu.visible = true
	
func _on_no_button_pressed():
	back()
	
func _input(event):
	if event.is_action_pressed("escape") and self.visible:
		self.accept_event()
		back()
