extends Node2D

var Error = load("res://incorrect_sound_effect_2437178451970681775.wav")
var Correct = load("res://correct_sound_effect_3966837008700000623.wav")

func Error_music():
	$Error.stream = Error
	$Error.play()

func Correct_music():
	$Error.stream = Correct
	$Error.play()
