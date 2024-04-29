extends Node3D


# Called when the node enters the scene tree for the first time.
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		$fire_partical.visible = not $fire_partical.visible
	pass
