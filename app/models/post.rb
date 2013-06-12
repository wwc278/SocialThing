class Post < ActiveRecord::Base
  attr_accessible :user_id, :body, :links_attributes, :user_ids

  has_many :links
  belongs_to :user

  accepts_nested_attributes_for :links, :reject_if => :all_blank
end
