class AddNotesColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :prescriptions, :notes, :string
    add_column :allergies, :notes, :string
    add_column :illnesses, :notes, :string
    add_column :immunizations, :notes, :string
  end
end
