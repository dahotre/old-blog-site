class RemoveIpFromTransactions < ActiveRecord::Migration
  def self.up
    remove_column :transactions, :ip
  end

  def self.down
    add_column :transactions, :ip, :string
  end
end
