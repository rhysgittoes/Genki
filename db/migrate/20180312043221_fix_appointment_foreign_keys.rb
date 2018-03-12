class FixAppointmentForeignKeys < ActiveRecord::Migration[5.1]
  def change
    remove_column :appointments, :doctor_id
    add_reference :appointments, :doctor, foreignkey: true
    add_reference :appointments, :patient, foreignkey: true
  end
end
