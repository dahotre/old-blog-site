class AddDraftToRamblings < ActiveRecord::Migration
  def self.up
    add_column :ramblings, :draft, :boolean
  end

  def self.down
    remove_column :ramblings, :draft
  end
end
