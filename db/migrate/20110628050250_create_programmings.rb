class CreateProgrammings < ActiveRecord::Migration
  def self.up
    create_table :programmings do |t|
      t.string :url_title
      t.string :title
      t.text :html
      t.integer :views
      t.string :author

      t.timestamps
    end
  end

  def self.down
    drop_table :programmings
  end
end
