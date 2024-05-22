extends Area2D

func _on_body_entered(body):
	if body.name == "player":
		body.become_pumped() 
		var tween = create_tween()		
		tween.tween_property(self, "position", position + Vector2(0, -15), 0.5)
		tween.tween_property(self, "modulate:a", 0.0, 0.5)
		tween.tween_callback(self.queue_free)
