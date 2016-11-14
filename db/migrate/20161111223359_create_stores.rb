class CreateStores < ActiveRecord::Migration[5.0]
  def change
    create_table :stores do |t|
      t.string :name
      t.string :owner
      t.string :location
      t.belongs_to :user

      t.timestamps
    end
  end
end
