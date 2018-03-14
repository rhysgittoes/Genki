class ChangeForeignKeyBackToPatientId < ActiveRecord::Migration[5.1]
  def change
    remove_column :health_profiles, :user_id, :bigint
    add_reference :health_profiles, :patient, foreignkey: true
  end
end
