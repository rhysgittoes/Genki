class CreateHealthProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :health_profiles do |t|
    	t.string :blood_type
    	t.integer :weight 
    	t.integer :height 
    	t.integer :bmi
    	t.string :insurer

      t.timestamps
    end
  end
end
