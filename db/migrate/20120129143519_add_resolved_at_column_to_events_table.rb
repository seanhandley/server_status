class AddResolvedAtColumnToEventsTable < ActiveRecord::Migration
  def change
    add_column :events, :resolved_at, :date, null: true
  end
end