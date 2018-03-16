class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.bigint :user_id
      t.string :text
      t.bigint :category
      t.bigint :user_type
      t.string  :link
      t.timestamps
    end
  end
end
