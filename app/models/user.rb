class User < ActiveRecord::Base
attr accessible :name, :email
validates :name, presence: true,length: { maximum: 30 }
VALID EMAIL REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, format: { with: VALID EMAIL REGEX }, uniqueness: { case sensitive: false }
before save { |user| user.email = email.downcase }
validates :password, presence: true, length: { minimum: 6 }
validates :password confirmation, presence: true
end