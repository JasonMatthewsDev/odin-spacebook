class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :requester_id
      t.integer :requestee_id
      t.boolean :status

      t.timestamps
    end
  end
end
