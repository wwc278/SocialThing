class PostShares < ActiveRecord::Base
  attr_accessible :post_id, :user_id

  #validates :post_id, :user_id, :presence => true
end
