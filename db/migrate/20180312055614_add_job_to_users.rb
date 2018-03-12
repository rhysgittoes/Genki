class AddJobToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :type, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :string
    add_column :users, :birthday, :date
    add_column :users, :language, :string
    add_column :users, :city, :string
    add_column :users, :country, :string
    add_column :users, :admission_id, :string
  end
end
