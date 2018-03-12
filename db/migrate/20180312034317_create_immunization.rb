class CreateImmunization < ActiveRecord::Migration[5.1]
  def change
    create_table :immunizations do |t|
      t.date :date
      t.string :type
    end
  end
end
