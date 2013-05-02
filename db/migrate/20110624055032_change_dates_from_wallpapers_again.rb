class ChangeDatesFromWallpapersAgain < ActiveRecord::Migration
  def self.up
    remove_column :wallpapers, :fromDate
    remove_column :wallpapers, :toDate
    add_column :wallpapers, :fromDate, :string
    add_column :wallpapers, :toDate, :string
  end

  def self.down
    remove_column :wallpapers, :fromDate
    remove_column :wallpapers, :toDate
    add_column :wallpapers, :fromDate, :integer
    add_column :wallpapers, :toDate, :integer
  end
end
