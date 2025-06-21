extends Button

func _on_pressed() -> void:
	if TurnManager.current_turn == TurnManager.Turn.PLAYER:
		SignalBus.emit_signal("tool_selected", SignalBus.Tool.BOW)
