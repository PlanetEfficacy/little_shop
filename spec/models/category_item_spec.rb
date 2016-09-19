require 'rails_helper'

RSpec.describe CategoryItem, type: :model do
  context "validations" do
    it { should belong_to(:item) }
    it { should belong_to(:category) }
  end
end
