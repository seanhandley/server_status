class CreateStatusesTable < ActiveRecord::Migration
  def up
    create_table :statuses, :force => true do |t|
      t.string :title, null: false, length: 30
    end
  end

  def down
    drop_table :statuses
  end
end