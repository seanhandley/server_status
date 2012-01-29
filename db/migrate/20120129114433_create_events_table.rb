class CreateEventsTable < ActiveRecord::Migration
  def up
    create_table :events, :force => true do |t|
      t.string :title, null: false, length: 30
      t.text :description, null: false, length: 1000
      t.date :scheduled_for, null: true
      t.references :status
      t.timestamps
    end
  end

  def down
    drop_table :events
  end
end