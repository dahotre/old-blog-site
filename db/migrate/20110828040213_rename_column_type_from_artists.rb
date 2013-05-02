class RenameColumnTypeFromArtists < ActiveRecord::Migration
  def self.up
    rename_column :artists, :type, :art
  end

  def self.down
    rename_column :artists, :art, :type
  end
end
