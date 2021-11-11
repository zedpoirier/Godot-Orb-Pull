extends Area

export var speed = 1.0
export var damping = 0.01

var isPulled = false
var attractor = null
var velocity = Vector3(0,0,0)

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.connect("timeout", self, "queue_free")
	pass # Replace with function body.

func _physics_process(delta):
	var prevVelocity = velocity
	if attractor:
		velocity = attractor.global_transform.origin - global_transform.origin
		velocity.normalized()
	else:
		velocity = Vector3(0,0,0)
	velocity = lerp(prevVelocity, velocity, damping)
	$MeshInstance.get_active_material(0).set_shader_param("Target", velocity)
	transform.origin += velocity * speed * 0.01


func _on_Orb_body_entered(body):
	isPulled = true
	attractor = body


func _on_Orb_body_exited(body):
	isPulled = false
	attractor = null

func _on_KillZone_body_entered(body):
	$MeshInstance.visible = false
	$Particles.restart()
	$Timer.start(1)
