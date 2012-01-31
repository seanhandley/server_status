class CreateUsersTable < ActiveRecord::Migration
  def up
    create_table :users, :force => true do |t|
      t.string :username
      t.string :password_digest
      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end