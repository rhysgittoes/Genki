class AddHealthProfileIdToTables < ActiveRecord::Migration[5.1]
  def change
    add_column :allergies, :health_profile_id, :bigint
    add_column :immunizations, :health_profile_id, :bigint
    add_column :illnesses, :health_profile_id, :bigint
    add_column :prescriptions, :health_profile_id, :bigint
  end
end
