class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.text :details
      t.belongs_to :department, foreign_key: true

      t.timestamps
    end
  end
end
