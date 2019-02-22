extends KinematicBody2D

var play_type="down"
var is_paly=false;

func _physics_process(delta):
	var velocity=Vector2()
	if Input.is_action_pressed("ui_up"):
		if play_type!="up" || !is_paly:
			is_paly=true;
			play_type="up"
			$Sprite/AnimationPlayer.play("up")
		velocity.y -=1
	if Input.is_action_pressed("ui_left"):
		if play_type!="left" || !is_paly:
			is_paly=true;
			play_type="left"
			$Sprite/AnimationPlayer.play("left")
		velocity.x -=1
	if Input.is_action_pressed("ui_down"):
		if play_type!="down" || !is_paly:
			is_paly=true;
			play_type="down"
			$Sprite/AnimationPlayer.play("down")
		velocity.y +=1
	if Input.is_action_pressed("ui_right"):
		if play_type!="right" || !is_paly:
			is_paly=true;
			play_type="right"
			$Sprite/AnimationPlayer.play("right")
		velocity.x +=1
	var collision_info = self.move_and_collide(velocity)
	if collision_info:
		velocity = velocity.bounce(collision_info.normal)

func _on_AnimationPlayer_animation_finished(anim_name):
	is_paly=false
	pass # replace with function body

