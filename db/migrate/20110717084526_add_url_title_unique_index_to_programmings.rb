class AddUrlTitleUniqueIndexToProgrammings < ActiveRecord::Migration
  def self.up
    add_index :programmings, :url_title, :unique => true
  end

  def self.down
    remove_index :programmings, :url_title
  end
end
