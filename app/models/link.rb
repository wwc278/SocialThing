class Link < ActiveRecord::Base
  attr_accessible :link_body, :post_id

  validates :link_body, :presence => true

  belongs_to :post
end
