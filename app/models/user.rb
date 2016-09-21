class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true,
                       uniqueness: true

  validates_confirmation_of :password,
    message: 'Please re-enter your password'

  has_many :orders
  has_many :reviews
  has_one :user_profile

  enum role: %w(user admin)
end
