class User < ActiveRecord::Base
  attr_accessible :email, :password
  attr_reader :password
  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true, :length => { :minimum => 6 }, :on => :create
  validates :session_token, :password_token, :password_digest, :presence => true
  
  before_validation :ensure_tokens
  
  has_many :circles, :foreign_key => :owner_id, :class_name => 'FriendCircle'
  has_many :circle_memberships, :foreign_key => :member_id, :class_name => 'FriendCircleMembership'
  
  has_many :posts
  
  def reset_password(pass)
    self.password = pass
    self.save!
  end
  
  def reset_password_token!
    self.password_token = User.generate_token
    self.save!
    self.password_token
  end
  
  def ensure_tokens
    self.session_token ||= User.generate_token
    self.password_token ||= User.generate_token
  end
  
  def self.generate_token
    SecureRandom.urlsafe_base64(16)
  end
  
  def password=(pass)
    @password = pass
    self.password_digest = BCrypt::Password.create(pass)
  end
  
  def is_password?(pass)
    BCrypt::Password.new(self.password_digest).is_password?(pass)
  end
  
  def reset_session_token!
    self.session_token = User.generate_token
    self.save!
    self.session_token
  end
  
  def self.find_by_credentials(credentials)
    user = User.find_by_email(credentials[:email])
    if user
      return user if user.is_password?(credentials[:password])
    end
    nil
  end
end
