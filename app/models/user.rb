class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :username, :zip_code ,:password 
 
  before_save :secure_hash 
  validates :email, presence: true, uniqueness: true , format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i}
  validates :username, :allow_blank => true, :uniqueness => true  , length: { minimum: 8}
  validates :password, presence: true , length: { minimum: 8}
  


def secure_hash  
  self.password=Digest::SHA2.hexdigest(password)
end

end
