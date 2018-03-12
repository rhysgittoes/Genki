class AddForeignKeysToTables < ActiveRecord::Migration[5.1]
  def change
    add_reference :health_profiles, :patient, foreign_key: true
    add_reference :appointments, :doctor, foreign_key: true
    add_reference :illnesses, :patient, foreign_key: true
    add_reference :illnesses, :appointment, foreign_key: true
    add_reference :allergies, :patient, foreign_key: true
    add_reference :allergies, :appointment, foreign_key: true
    add_reference :immunizations, :patient, foreign_key: true
    add_reference :immunizations, :appointment, foreign_key: true
  end
end
