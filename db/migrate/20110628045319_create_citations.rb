class CreateCitations < ActiveRecord::Migration
  def self.up
    create_table :citations do |t|
      t.string :link
      t.string :citation_title
      t.string :author
      t.integer :rambling_id
      t.integer :programming_id

      t.timestamps
    end
  end

  def self.down
    drop_table :citations
  end
end
