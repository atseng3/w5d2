class FriendCircleMembership < ActiveRecord::Base
  attr_accessible :member_id, :circle_id
  
  belongs_to :member, :foreign_key => :member_id, :class_name => 'User'
  belongs_to :friend_circle, :foreign_key => :circle_id, :class_name => 'FriendCircle'
end
