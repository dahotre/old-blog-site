class CreateProgrammingTagJoinTable < ActiveRecord::Migration
  def self.up
    create_table :programmings_tags, :id => false do |t|
      t.integer :programming_id
      t.integer :tag_id
    end
  end

  def self.down
    drop_table :programmings_tags
  end
end
