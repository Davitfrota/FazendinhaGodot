extends Node2D


func _ready():
	Global.get_buttons_from_scene(self)
	Controller.set_actual_button($Retangulo)


func _on_Retangulo_pressed():
	Error.Error_music()
	$AnimationPlayer.play("Erro")
	Global.add_points(-1)

func _on_Lozango_pressed():
	Error.Correct_music()
	$AnimationPlayer.play("Correct")
	yield($AnimationPlayer,"animation_finished")
	Global.add_points(1)
	Global.choose_level()
	

func _on_Tri_pressed():
	Error.Error_music()
	$AnimationPlayer.play("Erro")
	Global.add_points(-1)

func _on_Qua_pressed():
	Error.Error_music()
	$AnimationPlayer.play("Erro")
	Global.add_points(-1)
