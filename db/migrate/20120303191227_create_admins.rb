class CreateAdmins < ActiveRecord::Migration
  def self.up
    create_table :admins do |t|
      t.string :username
      t.string :password
      t.string :atype

      t.timestamps
    end
  end

  def self.down
    drop_table :admins
  end
end
