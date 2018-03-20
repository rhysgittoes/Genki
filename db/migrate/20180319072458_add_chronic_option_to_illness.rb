class AddChronicOptionToIllness < ActiveRecord::Migration[5.1]
  def change
    add_column :illnesses, :chronic, :string, default: "false"
  end
end
