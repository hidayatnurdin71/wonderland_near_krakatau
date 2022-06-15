extends VBoxContainer
#
#export(String) var label
#export(String) var bus_name
#export(NodePath) var audio_stream_player_path
#
#var audio_stream_player:AudioStreamPlayer
#func play_music():
#	audio_stream_player.play()
#func _ready():
#	audio_stream_player = get_node(audio_stream_player_path)
#	var bus_idx = AudioServer.get_bus_index(bus_name)
#	$HSlider.value = AudioServer.get_bus_volume_db(bus_idx)
#
#func _on_HSlider_value_changed(value):
#	var bus_idx = AudioServer.get_bus_index(bus_name)
#	if value > $HSlider.min_value:
#		AudioServer.set_bus_mute(bus_idx,false)
#		AudioServer.set_bus_volume_db(bus_idx, value)
#	else:
#		AudioServer.set_bus_mute(bus_idx, true)
