extends Control


func _on_btn_calc_pressed():
	var num1 = int($txt475.text)
	var num2 = int($txt821.text)
	var num3 = int($txt369.text)
	var num4 = int($txt562.text)
	var Sum = num1 + num2 + num3 + num4
	var Average = Sum / 4
	$lblSum.text = "Sum: " + str(Sum)
	$lblAverage.text = "Average: " +str(Average)
	# + 1 * /       ** pow
	# str: string (text)
	# int: integer (whole number)
	# float: floating-point (num w/ decimal)

func _on_btn_clear_pressed():
	$lblSum.text = ""
	$lblAverage.text = ""

func _on_btn_exit_pressed():
	get_tree().quit()
