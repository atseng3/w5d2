class FriendCircle < ActiveRecord::Base
  attr_accessible :name, :owner_id, :member_ids
  validates :name, :owner_id, :presence => true
  
  belongs_to :owner, :foreign_key => :owner_id, :class_name => 'User'
  has_many :member_memberships, :foreign_key => :circle_id, :class_name => 'FriendCircleMembership'
  has_many :members, :through => :member_memberships, :source => :member
  
  has_many :posts, :through => :post_shares, :source => :post
end
