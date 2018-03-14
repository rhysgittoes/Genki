class FixTyposInAppointments < ActiveRecord::Migration[5.1]
  def change
    rename_column :appointments, :symtoms, :symptoms
  end
end
