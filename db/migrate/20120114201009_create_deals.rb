class CreateDeals < ActiveRecord::Migration
  def self.up
    create_table :deals do |t|
      t.string :dodTitle
      t.string :dodImage
      t.string :dodPrice
      t.string :dodSave
      t.string :buzzTitle
      t.string :buzzImage
      t.string :buzzPrice
      t.string :buzzSave

      t.timestamps
    end
  end

  def self.down
    drop_table :deals
  end
end
