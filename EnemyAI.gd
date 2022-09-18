extends CharacterBody2D

@onready var player:Sprite2D = $"/root/Main/Player"
@onready var target_sprite:Sprite2D = $"/root/Main/TargetSprite2d"
@onready var agent:NavigationAgent2D = $NavigationAgent2d

func _ready():
	agent.set_target_location(player.global_position)

func _physics_process(delta):
	var target = agent.get_next_location()
	var pos = get_global_position()
	
	target_sprite.global_position = target
	
	var direction = (target-pos).normalized()

	velocity = direction * 3200 * delta
	
	move_and_slide()
