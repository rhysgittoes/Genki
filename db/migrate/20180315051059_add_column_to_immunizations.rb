class AddColumnToImmunizations < ActiveRecord::Migration[5.1]
  def change
    add_column :immunizations, :expiration_date, :date
  end
end
