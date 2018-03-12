class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.date :date
      t.text :symtoms, array: true, default: []
      t.text :diagnosis 
      t.string :referrals
      t.text :notes
    end
  end
end

