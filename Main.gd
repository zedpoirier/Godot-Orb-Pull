extends Spatial

var leftHand
var rightHand

var interval = 0.5
var timer = 0.0

# input handling -- uses the input manager settings with custom "actions"
func _input(event):
	if event.is_action_pressed("exit"):
		get_tree().quit()

# Called when the node enters the scene tree for the first time.
func _ready():
	leftHand = $Player/LeftHandController
	rightHand = $Player/RightHandController


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if timer >= interval:
		#print(leftHand.get_global_transform().origin)
		#print(rightHand.global_transform.origin)
		timer = 0.0
