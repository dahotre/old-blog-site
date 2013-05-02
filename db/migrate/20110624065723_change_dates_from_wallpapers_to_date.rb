class ChangeDatesFromWallpapersToDate < ActiveRecord::Migration
  def self.up
    remove_column :wallpapers, :fromDate
    remove_column :wallpapers, :toDate
    add_column :wallpapers, :fromDate, :date
    add_column :wallpapers, :toDate, :date
  end

  def self.down
    remove_column :wallpapers, :fromDate
    remove_column :wallpapers, :toDate
    add_column :wallpapers, :fromDate, :string
    add_column :wallpapers, :toDate, :string
  end
end
