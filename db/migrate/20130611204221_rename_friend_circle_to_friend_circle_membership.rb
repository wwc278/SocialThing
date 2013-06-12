class RenameFriendCircleToFriendCircleMembership < ActiveRecord::Migration
  def change
    rename_table :friend_circles, :friend_circle_memberships
  end
end
