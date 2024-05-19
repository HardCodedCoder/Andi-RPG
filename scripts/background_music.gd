extends AudioStreamPlayer

const level_music = preload("res://music/background_music.mp3")

func _play_music(music: AudioStream, volume = -20):
	if stream == music:
		return
		
	stream = music
	stream.loop = true
	volume_db = volume
	play()
	
func play_music_level():
	_play_music(level_music)
