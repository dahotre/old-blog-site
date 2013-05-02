class AddExhibitAndTypeToArtist < ActiveRecord::Migration
  def self.up
    add_column :artists, :exhibit, :text
    add_column :artists, :type, :string
  end

  def self.down
    remove_column :artists, :type
    remove_column :artists, :exhibit
  end
end
