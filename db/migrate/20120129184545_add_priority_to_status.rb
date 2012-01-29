class AddPriorityToStatus < ActiveRecord::Migration
  def change
    add_column :statuses, :priority, :integer
    add_index :statuses, :priority, :unique => true
  end
end