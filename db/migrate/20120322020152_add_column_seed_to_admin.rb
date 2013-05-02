class AddColumnSeedToAdmin < ActiveRecord::Migration
  def self.up
    add_column :admins, :seed, :string
  end

  def self.down
    remove_column :admins, :seed
  end
end
