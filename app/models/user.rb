require 'bcrypt'

class User < ActiveRecord::Base
  attr_accessible :name, :username, :password, :friend_ids

  validates :name, :username, :password_digest, :presence => true
  validates :username, :uniqueness => true

  has_many :friend_circle_memberships, foreign_key: :owner_id
  has_many :friends, :through => :friend_circle_memberships, class_name: "User",
           foreign_key: :friend_id
  has_many :joined_friend_circles, class_name: "FriendCircleMembership",
           foreign_key: :friend_id
  has_many :owners_of_friend_circle, through: :joined_friend_circles,
           source: :owner
  has_many :posts

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end

  def verify_password(password)
    BCrypt::Password.new(self.password_digest) == password
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!

    self.session_token
  end
end
