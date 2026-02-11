class_name GameManager
extends Node

@export var death_screen : CanvasLayer
@export var win_screen : CanvasLayer

func _ready() -> void:
	if death_screen: death_screen.hide()
	if win_screen: win_screen.hide()


func _player_die():
	print("joueur est mort")
	_show_screen(death_screen)

func _player_win():
	print("joueur win game")
	_show_screen(win_screen)

func _show_screen(screen: CanvasLayer):
	if screen:
		screen.show()
		get_tree().paused = true 

func _on_restart_button_pressed():
	print("reload level")
	get_tree().paused = false
	get_tree().reload_current_scene()
