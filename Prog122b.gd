extends Control



func _on_btn_calc_pressed():
	$ItemList.add_item("Number  Pay")
	for num in range(1, 41):
		var pay = num * 4 
		var line = str(num) + "  " + str(pay)
		$ItemList.add_item(line)


func _on_btn_clear_pressed():
	$ItemList.clear()


func _on_btn_exit_pressed():
	get_tree().quit()
