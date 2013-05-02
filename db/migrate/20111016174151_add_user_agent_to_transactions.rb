class AddUserAgentToTransactions < ActiveRecord::Migration
  def self.up
    add_column :transactions, :user_agent, :string
  end

  def self.down
    remove_column :transactions, :user_agent
  end
end
