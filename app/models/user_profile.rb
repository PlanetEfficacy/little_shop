class UserProfile < ActiveRecord::Base
  belongs_to :user

  def full_name
    "#{first_name} #{last_name}"
  end

  def address
    "#{street_address}\n#{city}, #{state} #{zipcode}"
  end
end
