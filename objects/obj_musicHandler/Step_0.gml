if room == rm_menu{
	if !audio_is_playing(snd_Im_Just_Chillin){
		currentSong = audio_play_sound(snd_Im_Just_Chillin, 0,1, 3*global.masterVolume);
	}
	audio_sound_gain(currentSong, 2*global.masterVolume, 0);
}else{
	if audio_is_playing(snd_Im_Just_Chillin){
		audio_stop_sound(snd_Im_Just_Chillin);
	}
}

if global.pause && !(room == rm_menu){
	if !audio_is_playing(snd_Criss_Cross_Contamination){
		currentSong = audio_play_sound(snd_Criss_Cross_Contamination, 0,1, 3*global.masterVolume);
	}
	audio_sound_gain(currentSong, 3*global.masterVolume, 0);
}else{
	if audio_is_playing(snd_Criss_Cross_Contamination){
		audio_stop_sound(snd_Criss_Cross_Contamination);
	}
}