extends Node

# Global tool types
enum Tool { NONE, STICK, LIGHT, BOW, WALK }
enum Upgrade {MULTI_SHOT, MORE_AMMO, BIGGER_LIGHT}

# Signals
signal tool_selected(tool: Tool)
signal upgrade_selected(selectedUpgrade: Upgrade)
signal stick_break
