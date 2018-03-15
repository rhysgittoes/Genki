class RemoveTypeAddNameForIllnessAllergyImmunization < ActiveRecord::Migration[5.1]
  def change
    remove_column :allergies, :type 
    remove_column :illnesses, :type 
    remove_column :immunizations, :type 

    add_column :allergies, :name, :string
    add_column :illnesses, :name, :string
    add_column :immunizations, :name, :string

  end
end
