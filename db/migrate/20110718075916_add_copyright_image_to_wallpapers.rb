class AddCopyrightImageToWallpapers < ActiveRecord::Migration
  def self.up
    remove_column :wallpapers, :copyright
    add_column :wallpapers, :copyright_image_url, :string
    add_column :wallpapers, :copyright_source_url, :string
  end

  def self.down
    add_column :wallpapers, :copyright, :string
    remove_column :wallpapers, :copyright_image_url
    remove_column :wallpapers, :copyright_source_url
  end
end
