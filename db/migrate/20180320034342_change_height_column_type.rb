class ChangeHeightColumnType < ActiveRecord::Migration[5.1]
  def change
    change_column :health_profiles, :height, :float
  end
end
