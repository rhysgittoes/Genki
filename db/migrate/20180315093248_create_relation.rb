class CreateRelation < ActiveRecord::Migration[5.1]
  def change
    create_table :relations do |t|
      t.bigint :patient_id, index: true
      t.bigint :doctor_id, index: true
    end
  end
end
