class RemoveForeignKeyFromHealthProfiles < ActiveRecord::Migration[5.1]
  def change
    remove_column :health_profiles, :patient_id, :bigint
    add_column :health_profiles, :patient_id, :int
  end
end
