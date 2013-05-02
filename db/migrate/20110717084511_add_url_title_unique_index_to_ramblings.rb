class AddUrlTitleUniqueIndexToRamblings < ActiveRecord::Migration
  def self.up
    add_index :ramblings, :url_title, :unique => true
  end

  def self.down
    remove_index :ramblings, :url_title
  end
end
