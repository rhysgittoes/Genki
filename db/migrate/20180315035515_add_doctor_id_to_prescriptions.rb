class AddDoctorIdToPrescriptions < ActiveRecord::Migration[5.1]
  def change
    add_column :prescriptions, :doctor_id, :bigint
  end
end
