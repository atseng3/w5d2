class Link < ActiveRecord::Base
  attr_accessible :url, :post_id
  validates :url, :post_id, :presence => true
  
  belongs_to :post
end
