class AddEmailToDoctors < ActiveRecord::Migration[5.1]
  def change
    add_column :doctors, :email, :string
    add_column :doctors, :experience, :integer
  end
end
