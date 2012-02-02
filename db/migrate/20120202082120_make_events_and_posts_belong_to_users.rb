class MakeEventsAndPostsBelongToUsers < ActiveRecord::Migration
  def change
    change_table :events do |t|
      t.references :user
    end

    change_table :updates do |t|
      t.references :user
    end
  end

end