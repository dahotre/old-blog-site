class AddRecToTransactions < ActiveRecord::Migration
  def self.up
    add_column :transactions, :rec, :boolean
  end

  def self.down
    remove_column :transactions, :rec
  end
end
