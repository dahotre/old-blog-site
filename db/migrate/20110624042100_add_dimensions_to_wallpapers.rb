class AddDimensionsToWallpapers < ActiveRecord::Migration
  def self.up
    add_column :wallpapers, :width, :integer
    add_column :wallpapers, :height, :integer
  end

  def self.down
    remove_column :wallpapers, :height
    remove_column :wallpapers, :width
  end
end
