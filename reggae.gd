extends Spatial
onready var musica = [$Music,$Music2,$Music3,$Music4,$Music5,$Music6]
var w = OS.window_size.x 
var h = OS.window_size.y

func loop(var animation):
	var anim = get_node("AnimationPlayer").get_animation(animation)
	anim.set_loop(true)
	get_node("AnimationPlayer").play(animation)
		
func _ready():
	randomize()
	loop("idle")

func _input(event):
	if event is InputEventMouseButton:
		var touch_position=event.position	
		if event.position.x in range(w/2-250,w/2+100) and event.position.y in range(h/2,h):
			$AnimationPlayer.play("kick")
			$kick.play()
			yield( get_node("AnimationPlayer"),"animation_finished")
			if $Music.playing==true:
				loop("dance")
			else:
				loop("idle")	
		elif event.position.x in range(w/2+60,w) and event.position.y in range(h-300,h):
			for i in musica:
				i.stop()
			musica[randi() % musica.size()].play()
			loop("dance")
			yield( get_node("Music"),"finished")
			$AnimationPlayer.play("sad")
			yield(get_node("AnimationPlayer"),"animation_finished")
			loop("idle")
		elif event.position.x in range(0,200) and event.position.y in range(h-500,h):
			$Armature.rotate(Vector3(0.0, 1.0, 0.0), 3.141/8)
			
			
		elif event.position.y in range(0,h/2-10):
			$AnimationPlayer.play("nervous")
			$Nervous.play()
			yield( get_node("AnimationPlayer"),"animation_finished")
			if $Music.playing==true:
				loop("dance")
			else:
				loop("idle")		
