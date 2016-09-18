require 'rails_helper'

RSpec.describe UserProfile, type: :model do

  context "validations" do
    it { should belong_to(:user) }
  end

  it "has a full name" do
    profile = Fabricate(:user_profile)
    expect(profile.full_name).to eq("#{profile.first_name} #{profile.last_name}")
  end

end
