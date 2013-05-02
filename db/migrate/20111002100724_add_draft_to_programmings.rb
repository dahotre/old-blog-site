class AddDraftToProgrammings < ActiveRecord::Migration
  def self.up
    add_column :programmings, :draft, :boolean
  end

  def self.down
    remove_column :programmings, :draft
  end
end
