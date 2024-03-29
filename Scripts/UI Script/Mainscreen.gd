extends Control

var volumebus := AudioServer.get_bus_index("Master")
var musicbus := AudioServer.get_bus_index("Music")
var sfxbus := AudioServer.get_bus_index("SFX")
#var weatherbus := AudioServer.get_bus_index("Weather")
var soundvaluearray = {"safedvolumevalue" : 1, "safedmusicvalue" : 1, "safedsfxvalue" : 1, "safedweathervalue" : 1}


func _ready():
	load_volume()

func _on_PlayButton_pressed():
	pass


func _on_OptionsButton_pressed():
	get_tree().change_scene("res://Scenes/Interface/Options.tscn")


func _on_CreditsButton_pressed():
	pass # Replace with function body.



func load_volume():
	var volumefile = File.new()
	if volumefile.file_exists("user://save_volume.dat"):
		volumefile.open("user://save_volume.dat", File.READ)
		#print(volumefile.result)
		soundvaluearray = volumefile.get_var()
		volumefile.close()
		
	AudioServer.set_bus_volume_db(volumebus, linear2db(soundvaluearray["safedvolumevalue"]))
	AudioServer.set_bus_volume_db(musicbus, linear2db(soundvaluearray["safedmusicvalue"]))
	AudioServer.set_bus_volume_db(sfxbus, linear2db(soundvaluearray["safedsfxvalue"]))
