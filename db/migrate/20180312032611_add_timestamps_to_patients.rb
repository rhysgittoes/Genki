class AddTimestampsToPatients < ActiveRecord::Migration[5.1]
  def change
    add_timestamps :patients
  end
end
