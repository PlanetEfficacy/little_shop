require 'rails_helper'

RSpec.describe User, type: :model do

  context "validations" do
    it { is_expected.to validate_uniqueness_of(:username)}
    it { is_expected.to have_secure_password }
    it { should have_many(:orders) }
    it { should have_one(:user_profile) }
  end

  it "is a standard user by default" do
    user = User.create(username: 'bob', password: 'bob1')
    expect(user.user?).to eq(true)
  end

  it "can be an admin" do
    user = User.create(username: 'admin', password: 'admin', role: 1)
    expect(user.admin?).to eq(true)
  end

  # it 'has a full name' do
  #   user = Fabricate(:user)
  #   profile = user.user_profile
  #   expect(user.full_name).to eq("#{profile.first_name} #{profile.last_name}")
  #
  # end
end
