class User < ActiveRecord::Base
  has_secure_password
  has_many :games
  validates :name, :email, :password_digest, presence: true
end
