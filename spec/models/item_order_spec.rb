require 'rails_helper'

RSpec.describe ItemOrder, type: :model do

  context "validations" do
    it { should belong_to(:item) }
    it { should belong_to(:order) }
  end

end
