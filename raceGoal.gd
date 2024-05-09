extends Node3D

var lap = 0
@export var next_level = "res://rc_world_2.tscn"
@onready var HUD = get_tree().get_first_node_in_group("HUD")

func _on_body_entered(body):
	if body.is_in_group("race"):
		lap += 1
	if lap == 3:
		HUD.popup.visible = true
		HUD.popup_label.text = "Loading..."
		await get_tree().create_timer(0.1).timeout 
	get_tree().change_scene_to_file("res://rc_world_2.tscn")
