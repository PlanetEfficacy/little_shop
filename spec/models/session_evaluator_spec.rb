require 'rails_helper'

RSpec.describe SessionEvaluator, type: :model do
  it "initializes with a session" do
    session = {}
    se = SessionEvaluator.new(session)
    expect(se.session).to be_instance_of(Hash)
  end

  it "redirects to cart if there are items in cart" do
    session = {:cart => {"1" => 1}}
    se = SessionEvaluator.new(session)
    expect(se.redirect_to_cart).to eq(true)
    expect(se.redirect_to_dashboard).to eq(false)
  end

  it "redirects to dashboard if there are no items in cart" do
    session = {}
    se = SessionEvaluator.new(session)
    expect(se.redirect_to_cart).to eq(false)
    expect(se.redirect_to_dashboard).to eq(true)
  end
end
