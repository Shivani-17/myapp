class User < ActiveRecord::Base
def feed
# This is preliminary. See "Following users" for the full implementation.
Micropost.where("user_id = ?", id)
end
has_secure_password
before_save { self.email = email.downcase }
has_many :microposts, dependent: :destroy
before_save :create_remember_token
private
def create_remember_token
self.remember_token = SecureRandom.urlsafe_base64
end
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  validates :password, presence: true, length: { minimum: 6 }
validates :password_confirmation, presence: true, length: { minimum: 6 }

end
