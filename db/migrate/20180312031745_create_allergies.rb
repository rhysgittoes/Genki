class CreateAllergies < ActiveRecord::Migration[5.1]
  def change
    create_table :allergies do |t|
    	t.string :type
    	t.string :severity
    	t.boolean :status
    	t.date :status_update
    end
  end
end
