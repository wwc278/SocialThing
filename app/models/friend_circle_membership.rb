class FriendCircleMembership < ActiveRecord::Base
  attr_accessible :owner_id, :friend_id

  belongs_to :owner, class_name: "User", foreign_key: :owner_id
  belongs_to :friend, class_name: "User", foreign_key: :friend_id
end
