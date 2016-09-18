class User < ActiveRecord::Base
  has_secure_password

  validates :username, presence: true,
                       uniqueness: true

  has_many :orders
  has_one :user_profile

  enum role: %w(user admin)
end
