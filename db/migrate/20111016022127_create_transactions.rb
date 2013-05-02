class CreateTransactions < ActiveRecord::Migration
  def self.up
    create_table :transactions do |t|
      t.references :user
      t.integer :programming_id
      t.integer :rambling_id
      t.string :ip
      t.string :remote_ip

      t.timestamps
    end
  end

  def self.down
    drop_table :transactions
  end
end
