class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string :comment
      t.string :commentor
      t.string :email
      t.integer :rambling_id
      t.integer :programming_id

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
