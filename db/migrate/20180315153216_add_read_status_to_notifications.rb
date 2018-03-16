class AddReadStatusToNotifications < ActiveRecord::Migration[5.1]
  def change
    add_column :notifications, :received, :boolean, :default => false
  end
end
