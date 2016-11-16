class AddStringToPhone < ActiveRecord::Migration[5.0]
  def change
  	change_column :departments, :phone_number, :string 
  end
end
