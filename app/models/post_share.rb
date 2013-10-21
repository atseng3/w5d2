class PostShare < ActiveRecord::Base
  attr_accessible :post_id, :circle_id
  validates :post_id, :circle_id, :presence => true
  
  belongs_to :post
  
  belongs_to :circle, :foreign_key => :circle_id, :class_name => "FriendCircle"
end
