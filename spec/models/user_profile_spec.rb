require 'rails_helper'

RSpec.describe UserProfile, type: :model do
  context "validations" do
    it { should belong_to(:user) }
  end

  it "has a full name" do
    profile = Fabricate(:user_profile)
    expect(profile.full_name).to eq("#{profile.first_name} #{profile.last_name}")
  end

  it "has an address" do
    profile = Fabricate(:user_profile)
    line_1 = "#{profile.street_address}"
    line_2 = "#{profile.city}, #{profile.state} #{profile.zipcode}"
    expect(profile.address).to eq("#{line_1}\n#{line_2}")
  end
end
