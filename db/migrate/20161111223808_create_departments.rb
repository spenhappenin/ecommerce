class CreateDepartments < ActiveRecord::Migration[5.0]
  def change
    create_table :departments do |t|
      t.string :name
      t.integer :phone_number
      t.belongs_to :store, foreign_key: true

      t.timestamps
    end
  end
end
