class CreatePrescriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :prescriptions do |t|
      t.string :medicine
      t.string :dosage
      t.string :refills
      t.date :expiration_date
    end
  end
end
