extends Node

# Set of unlocked upgrades
var unlocked_upgrades: Array[SignalBus.Upgrade] = []

func _ready() -> void:
	SignalBus.connect("upgrade_selected", Callable(self, "_on_upgrade_selected"))

func _on_upgrade_selected(upgrade: SignalBus.Upgrade) -> void:
	if not unlocked_upgrades.has(upgrade):
		unlocked_upgrades.append(upgrade)
		print("UpgradeManager: unlocked", upgrade)
	else:
		print("UpgradeManager: already unlocked", upgrade)

# Check if an upgrade is active
func has_upgrade(upgrade: SignalBus.Upgrade) -> bool:
	return unlocked_upgrades.has(upgrade)
