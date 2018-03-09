class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.date :birthday
      t.string :language
      t.string :email
      t.string :city
      t.string :country
      t.string :admission_id
    end
  end
end
