extends Area2D

@export var speed = 100

var screen_size
var posicao_inicial = Vector2(640, 690)

signal pontua

func _ready():
	screen_size = get_viewport_rect().size
	
func _process(delta):
	var velocity = Vector2()
	if Input.is_action_pressed("ui_up"):
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.y += 1
	velocity = velocity.normalized() * speed
	
	if velocity.length() > 0:
		$Animacao.play()
	else:
		$Animacao.stop()
	
	if velocity.y > 0:
		$Animacao.animation = "baixo"
	else:
		$Animacao.animation = "cima"
		
	position += velocity * delta
	position.y = clamp(position.y, 0, screen_size.y)
