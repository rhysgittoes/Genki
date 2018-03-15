class AddKeyToAppointments < ActiveRecord::Migration[5.1]
  def change
    add_column :appointments, :key, :string
  end
end
