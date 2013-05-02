class AddFbUrlToArtist < ActiveRecord::Migration
  def self.up
    add_column :artists, :fb_url, :string
  end

  def self.down
    remove_column :artists, :fb_url
  end
end
