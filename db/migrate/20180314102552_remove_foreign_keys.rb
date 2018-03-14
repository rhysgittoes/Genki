class RemoveForeignKeys < ActiveRecord::Migration[5.1]
  def change
    remove_column :illnesses, :user_id, :bigint
    remove_column :illnesses, :patient_id, :bigint
    remove_column :allergies, :patient_id, :bigint
    remove_column :immunizations, :patient_id, :bigint
    
    add_column :illnesses, :patient_id, :bigint
    add_column :allergies, :patient_id, :bigint
    add_column :prescriptions, :patient_id, :bigint
    add_column :immunizations, :patient_id, :bigint
  end
end
