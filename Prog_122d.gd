extends Control

func _on_btn_calc_pressed():
	$ItemList.add_item ("x     y")
	for num in range (-12, 16):
		var num1 = num*1**6
		var num2 = num*3**5
		var num3 = num*93**4
		var num4 = num*87**3
		var num5 = num*1596**2
		var num6 = num*1380**1
		var num7 = num*2800
		var ok = num1 - num2 - num3 + num4 + num5 - num6 - num7
		
	
func _on_btn_clear_pressed():
	$ItemList.clear()


func _on_btn_exit_pressed():
	get_tree().quit()
