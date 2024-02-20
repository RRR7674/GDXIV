extends Area2D
var hit_flag:bool = false
@onready var n_visible_area:Node2D = $VisibleArea
@onready var n_hit_area:CollisionShape2D = $HitArea

func _ready() -> void:
	# ビューポートのサイズを取得
	var viewport_size: Vector2 = get_viewport_rect().size
	# オブジェクトをビューポートの中央に配置
	position = viewport_size / 2
	# AoEの半径を取得
	var aoe_radius = n_visible_area.radius
	print("AoE Radius:", n_visible_area.radius)
	# 
	n_hit_area.shape.radius = aoe_radius

func _on_timer_timeout() -> void:
	hit_flag = true
	#queue_free()
	
func _on_body_entered(body: Node2D) -> void:
	print("on_body_entered!",body)
	if body.name == "Player" and body.INVINCIBLE == false and body.can_hit == true and hit_flag == true:
		print("Hit!")
		Audio.get_node("SeFail").play()
		


func _on_body_exited(body: Node2D) -> void:
	print("on_body_exited!",body)
