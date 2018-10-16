class User < ActiveRecord::Base
  attr_writer :authenticate_with_credentials 

  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, :length => {:minimum => 8 }
  validates :password_confirmation, presence: true
  validates :name, presence: true

  def self.authenticate_with_credentials(email, password)
     
    user = User.find_by_email(email) 

    if user && user.authenticate(password)
      user 
    elsif
      nil 
    end 
  end
end


