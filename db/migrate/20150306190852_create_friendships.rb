class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :requester_id
      t.integer :requested_id
      t.boolean :accepted

      t.timestamps
    end
    add_index :friendships, :requester_id
    add_index :friendships, :requested_id
    add_index :friendships, [:requester_id, :requested_id], unique: true
  end
end
