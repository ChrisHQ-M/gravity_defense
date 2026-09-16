extends Node

# Manages the musics and SFX of the game

@onready var music : AudioStreamPlayer = $AudioMusic

# Plays one music in the node's stream "AudioMusic" with a loop option and returns the node.
func play_music(stream : AudioStream, loop : bool) -> AudioStreamPlayer:
	if music.stream == stream:
		return
	
	# Configurations of the music node
	music.stream = stream
	music.stream.loop = loop
	music.bus = "Music"
	music.play()
	
	return music

# Create an AudioStreamPlayer that frees after playing a SFX. Can change the volume_db and pitch_scale and returns the node.
func play_sfx(stream : AudioStream, vol_db : float, pitch_scale : float) -> AudioStreamPlayer:
	var new_sfx : AudioStreamPlayer = AudioStreamPlayer.new()
	add_child(new_sfx)
	
	# Configurations of the SFX node
	if stream != null:
		new_sfx.stream = stream
		new_sfx.volume_db += vol_db
		new_sfx.pitch_scale += pitch_scale
		new_sfx.bus = "SFX"
		new_sfx.play()
	
	return new_sfx
