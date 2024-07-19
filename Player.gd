extends CharacterBody2D

@onready var anim_tree = $AnimationTree
@onready var anim_state = anim_tree.get("parameters/playback")

var input_movement = Vector2.ZERO
var speed = 70

func _ready():
	pass

func _physics_process(delta):
	move()

func move():
	input_movement = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if input_movement != Vector2.ZERO:
		$Idle.visible = false
		$Walk.visible = true
		anim_tree.set("parameters/Idle/blend_position", input_movement)
		anim_tree.set("parameters/Walk/blend_position", input_movement)
		anim_state.travel("Walk")
		velocity = input_movement * speed
	
	if input_movement == Vector2.ZERO:
		anim_state.travel("Idle")
		$Idle.visible = true
		$Walk.visible = false
		velocity = Vector2.ZERO
	
	move_and_slide()

#const max_speed = 100
#const accel = 1000
#const friction = 1500
#
#var input = Vector2.ZERO
#
#
#func _physics_process(delta):
	#player_movement(delta)
#
#
#func get_input():
	#input.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	#input.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	#return input.normalized()
#
#func player_movement(delta):
	#input = get_input()
	#
	#if input == Vector2.ZERO:
		#anim_tree.set("parameters/Idle/blend_position", input)
		#anim_tree.set("parameters/Walk/blend_position", input)
		#anim_state.travel("Walk")
		#if velocity.length() > (friction * delta):
			#velocity -= velocity.normalized() * (friction * delta)
		#else:
			#anim_state.travel("Idle")
			#velocity = Vector2.ZERO
			#
	#else:
		#velocity += (input * accel * delta)
		#velocity = velocity.limit_length(max_speed)
		#
	#move_and_collide(velocity * delta)



