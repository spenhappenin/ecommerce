class AddColorToStores < ActiveRecord::Migration[5.0]
  def change
    add_column :stores, :color, :string
  end
end
