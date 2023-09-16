extends GridContainer
@onready var top_menu = $"../TopVBoxContainer"
@onready var main_menu = $".."

func back():
	self.visible = false
	top_menu.visible = true
	
func _input(event):
	if event.is_action_pressed("escape") and self.visible:
		self.accept_event()
		back()
	
func _on_resolution_option_button_item_selected(index):
	var resolution_text: String = $ResolutionOptionButton.get_item_text(index)
	var res_split = resolution_text.split("x")
	var width: int = int(res_split[0])
	var height: int = int(res_split[1])
	DisplayServer.window_set_size(Vector2i(width,height))



func _on_full_screen_check_box_toggled(is_fullscreen):
	if is_fullscreen:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)


func _on_master_volume_h_slider_value_changed(value):
	var bus_index = AudioServer.get_bus_index(main_menu.audio_bus_name)
	print (value)
	AudioServer.set_bus_volume_db(bus_index, linear_to_db(value))


func _on_back_button_pressed():
	back()
	
