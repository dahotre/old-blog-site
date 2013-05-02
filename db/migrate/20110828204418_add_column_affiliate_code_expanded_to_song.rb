class AddColumnAffiliateCodeExpandedToSong < ActiveRecord::Migration
  def self.up
    add_column :songs, :affiliate_code_expanded, :text
  end

  def self.down
    remove_column :songs, :affiliate_code_expanded
  end
end
