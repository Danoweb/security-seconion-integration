class User < ActiveRecord::Base
  has_secure_password
    
  def to_s
    email
  end

  before_validation lambda{
    self.state ||= 'on'
  }, :on => :create

  validates :email, :uniqueness => true, :email => true
  validates :state, :inclusion => {:in => ['on', 'off']}
end
