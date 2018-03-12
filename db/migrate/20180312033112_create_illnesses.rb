class CreateIllnesses < ActiveRecord::Migration[5.1]
  def change
    create_table :illnesses do |t|
      t.string :type
      t.boolean :status
      t.references :user
    end
  end
end
