class CreateDoctors < ActiveRecord::Migration[5.1]
  def change
    create_table :doctors do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :birthday
      t.string :language
      t.string :city
      t.string :country
      t.integer :admission_id
      t.string :certification
      t.timestamps 
    end
  end
end
