extends Node3D

var lap = 0

func _on_body_entered(body):
	if body.is_in_group("Player"):
		lap += 1
	if lap == 3:
		get_tree().change_scene_to_file("res://rc_world_2.tscn")
