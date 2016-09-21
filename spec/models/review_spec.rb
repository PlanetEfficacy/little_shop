require 'rails_helper'

RSpec.describe Review, type: :model do
  context "validations" do
    it { should belong_to(:item) }
    it { should belong_to(:user) }
    it { should validate_presence_of :stars }
    it { should validate_presence_of :body }
    it { should validate_length_of(:body).is_at_least(15)}
  end
end
