class AddAppointmentForeignKeyToPrescriptions < ActiveRecord::Migration[5.1]
  def change
    add_reference :prescriptions, :appointment, foreign_key: true
  end
end
