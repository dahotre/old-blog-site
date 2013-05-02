class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.string :name
      t.string :vendor
      t.text :affiliate_code
      t.references :artist

      t.timestamps
    end
  end

  def self.down
    drop_table :songs
  end
end
