require 'rails_helper'

RSpec.feature "unauthenticated user" do
  scenario "cannot view another user's private data" do
      # As an unauthenticated user
      order_1 = Fabricate(:order)
      order_2 = Fabricate(:order)
      user = order_1.user

      # I cannot view another user's private data (current or past orders, etc)
      visit orders_path
      expect(page).to_not have_css("td", :text => order_1.id)
      expect(current_path).to eq(login_path)
  end

  scenario "is redirected to login/create account when attempting to checkout" do
      # As an unauthenticated user
      # I should be redirected to login/create accoun when I try to checkout
      item_id = 1
      page.driver.post(orders_path, {:params => {
                                        :session => {
                                          :cart => { item_id => 1 }
                                          }
                                        }
                                      })
      expect(current_path).to eq(login_path)
  end
end
