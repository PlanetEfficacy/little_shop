class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :item
  validates :stars, presence: true
  validates :body, presence: true
  validates_length_of :body, minimum: 15, on: :create
end
