class AddStoryToWallpapers < ActiveRecord::Migration
  def self.up
    add_column :wallpapers, :story, :string
  end

  def self.down
    remove_column :wallpapers, :story
  end
end
