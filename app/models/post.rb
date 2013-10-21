class Post < ActiveRecord::Base
  attr_accessible :body
  
  has_many :links
  
  has_many :circles, :through => :post_shares, :source => :circle
end
