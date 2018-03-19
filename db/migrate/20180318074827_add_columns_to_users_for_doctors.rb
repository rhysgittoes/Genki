class AddColumnsToUsersForDoctors < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :phone_number, :string
    add_column :users, :address, :string
    add_column :users, :secondary_address, :string
    add_column :users, :zip_code, :string
    add_column :users, :state, :string
    add_column :users, :specialty, :string
    add_column :users, :practice, :string
  end
end
