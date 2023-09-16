extends VBoxContainer

@onready var quit_menu = $"../QuitVBoxContainer"
@onready var main_scene = preload("res://game_scenes/main_scene.tscn")
@onready var options_menu = $"../OptionsGridContainer"

func _ready():
	self.visible = true
	quit_menu.visible = false
	options_menu.visible = false
	
func _input(event):
	if event.is_action_pressed("escape") and self.visible:
		self.accept_event()
		_on_quit_button_pressed()

func _on_quit_button_pressed():
	self.visible = false
	quit_menu.visible = true


func _on_play_button_pressed():
	get_tree().change_scene_to_packed(main_scene)


func _on_options_button_pressed():
	self.visible = false
	options_menu.visible = true
