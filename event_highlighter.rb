class Spriteset_Map
  alias_method :old_initialize, :initialize
  def initialize
    old_initialize
    create_highlight_sprites
  end

  alias_method :old_update, :update
  def update
    old_update
    update_highlight_positions if @highlight_sprites
  end

  def create_highlight_sprites
    dispose_highlight_sprites if @highlight_sprites
    @highlight_sprites = []

    $game_map.events.values.each do |event|
      next unless event  # Skip nil events if any

      sprite = Sprite.new(@viewport1)
      sprite.bitmap = Bitmap.new(32, 32)
      color = Color.new(255, 255, 0, 80)  # Yellow with transparency
      sprite.bitmap.fill_rect(0, 0, 32, 32, color)
      sprite.z = 10

      # Position the sprite at event's screen coords, centered on tile
      sprite.x = event.screen_x - 16
      sprite.y = event.screen_y - 32

      @highlight_sprites << {:sprite => sprite, :event => event}
    end
  end

  def update_highlight_positions
    @highlight_sprites.each do |obj|
      obj[:sprite].x = obj[:event].screen_x - 16
      obj[:sprite].y = obj[:event].screen_y - 32
    end
  end

  def dispose_highlight_sprites
    @highlight_sprites.each { |obj| obj[:sprite].dispose }
    @highlight_sprites.clear
  end

  alias_method :old_dispose, :dispose
  def dispose
    dispose_highlight_sprites if @highlight_sprites
    old_dispose
  end
end

class Scene_Map
  alias_method :old_transfer_player, :transfer_player
  def transfer_player
    old_transfer_player
    @spriteset.create_highlight_sprites if @spriteset
  end
end
