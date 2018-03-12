class AddTimestampsToTables < ActiveRecord::Migration[5.1]
  def change
    add_timestamps :allergies
    add_timestamps :appointments
    add_timestamps :illnesses
    add_timestamps :immunizations
    add_timestamps :prescriptions
  end
end
