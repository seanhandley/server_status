class CreateUpdatesTable < ActiveRecord::Migration
  def up
    create_table :updates, :force => true do |t|
      t.string :description, null: false, length: 1000
      t.references :event
      t.timestamps
    end
  end

  def down
    drop_table :updates
  end
end