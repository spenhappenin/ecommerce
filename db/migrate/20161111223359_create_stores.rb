class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :owner
      t.string :location
      t.string :color

      t.timestamps
    end
  end
end
