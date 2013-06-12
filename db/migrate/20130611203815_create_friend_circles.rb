class CreateFriendCircles < ActiveRecord::Migration
  def change
    create_table :friend_circles do |t|
      t.integer :owner_id, :null => false
      t.integer :friend_id, :null => false

      t.timestamps
    end
  end
end
