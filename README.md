# 🎯 RPG Maker XP – Interactable Event Highlighter

A small RPG Maker XP script that visually highlights all in-map events, allowing players or modders to easily spot interactable objects — no more spam-clicking tiles!

---

## 🧰 Features

- Adds a transparent yellow overlay to all events on the map
- Automatically updates the highlight position as the player moves
- Re-applies highlight when transferring to a new map
- No changes required to individual events or maps

---

## 🕹️ Use Case

This script is designed for **modders, testers, and accessibility-focused players** who want to easily identify interactable tiles without pressing the action key on every tile.

---

## ⚙️ Installation

1. Open your RPG Maker XP project.
2. In the **Script Editor**, scroll down to **"Spriteset_Map"** or a blank section near the bottom.
3. Paste the contents of `event_highlighter.rb`.
4. Playtest your game.

---

## 🔄 How It Works

- Hooks into `Spriteset_Map` and `Scene_Map` to overlay a yellow semi-transparent sprite on each event.
- Sprites are re-positioned every frame to match moving events.
- On map transfer, highlights are recreated for the new map.

---

## 📝 Notes

- The highlight sprite is purely visual and does not affect event behavior.
- You can modify the color or size by editing:
  ```ruby
  color = Color.new(255, 255, 0, 80)  # RGBA
  sprite.bitmap.fill_rect(0, 0, 32, 32, color)
