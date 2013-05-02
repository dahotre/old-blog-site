class AddUrlUniquenessIndexToWallpaper < ActiveRecord::Migration
  def self.up
    add_index :wallpapers, :url, :unique => true
  end

  def self.down
    remove_index :wallpapers, :url
  end
end
