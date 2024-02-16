extends Control


func _on_btn_calc_pressed():
	var Radius = float ($txtPi.text)
	var pi = 3.14159
	var Area = pi + Radius**2
	var Circum = 2 * pi * Radius
	$lblArea.text = "Area: " + str(Area)
	$lblCircum.text = "Circum: " + str(Circum)
	# + 1 * /       ** pow
	# str: string (text)
	# int: integer (whole number)
	# float: floating-point (num w/ decimal)

func _on_btn_clear_pressed():
	$lblRadius.text = ""
	$lblArea.text = ""
	$lblCircum.text = ""

func _on_btn_exit_pressed():
	get_tree().quit()
