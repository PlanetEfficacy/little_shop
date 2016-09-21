require 'rails_helper'

RSpec.describe Review, type: :model do
  context "validations" do
    it { should belong_to(:item) }
    it { should belong_to(:user) }
  end
end
