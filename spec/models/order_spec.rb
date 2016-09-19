require 'rails_helper'

RSpec.describe Order, type: :model do

  context "associations" do
    it { should belong_to(:user) }
    it { should have_many(:item_orders) }
    it { should have_many(:items)}
  end

  context 'status' do
    let(:order) { [:ordered, :paid, :cancelled, :completed] }

    it 'has the right enum index' do
      order.each_with_index do |item, index|
        expect(described_class.statuses[item]).to eq index
      end
    end
  end
end
