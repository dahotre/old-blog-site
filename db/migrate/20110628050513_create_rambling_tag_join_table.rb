class CreateRamblingTagJoinTable < ActiveRecord::Migration
  def self.up
    create_table :ramblings_tags, :id => false do |t|
      t.integer :rambling_id
      t.integer :tag_id
    end
  end

  def self.down
    drop_table :ramblings_tags
  end
end
