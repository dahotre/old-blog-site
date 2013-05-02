class CreateWallpapers < ActiveRecord::Migration
  def self.up
    create_table :wallpapers do |t|
      t.date :fromDate
      t.date :toDate
      t.string :url
      t.references :artist
      t.string :copyright

      t.timestamps
    end
  end

  def self.down
    drop_table :wallpapers
  end
end
