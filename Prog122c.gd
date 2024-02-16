extends Control

func _on_btnCalc_pressed():
	$ItemList.add_item ("**")
	for num in range(2, 12, 2):
		var numsqaure = num**2 #pow(num, 2)
		var num2 = sqrt(num)
		var line = str(num) + "  " + str(num) + "  " + str(num)
		$ItemList.add_item(line)


func _on_btnClear_pressed():
	$ItemList.clear()


func _on_btnExit_pressed():
	get_tree().quit()
