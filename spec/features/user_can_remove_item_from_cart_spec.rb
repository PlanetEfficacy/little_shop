# As a visitor
#   When I visit "/cart"
#   And I click link "Remove"
#   Then my current page should be "/cart"
#   And I should see a message styled in green
#   And the message should say "Successfully removed SOME_ITEM from your cart."
#   And the title "SOME_ITEM" should be a link to that item in case the user wants to add it back
#   And I should not see the item listed in cart
# expect(flash[:success]).to be_present
# expect(ai[:style]).to match(/color: red/)

RSpec.feature "visitor can remove item from cart" do
  scenario "visitor doesn't see the item in the cart after removing" do

    item = Item.create(title: "Paperclip", description: "This is an artisinal paperclip!", price: 5000, image_url: "http://tectonicablog.com/wp-content/uploads/2013/01/023-455x606.jpg")
    cart = Cart.new(nil)
    cart.add_item(item.id)
    ApplicationController.any_instance.stub(:set_cart).returns(cart)
    #   When I visit "/cart"
    visit cart_path
    #   And I click link "Remove"
    click_on "Remove"
    #   Then my current page should be "/cart"
    expect(current_path).to eq('/cart')
    #   And I should see a message styled in green
    expect(flash[:success][:style]).to match(/color: green/)
    #   And the message should say "Successfully removed SOME_ITEM from your cart."
    #   And the title "SOME_ITEM" should be a link to that item in case the user wants to add it back
    expect(flash[:success]).to have_content("Successfully removed #{link_to item_path(item)} from your cart.")
    #   And I should not see the item listed in cart
    within(".invoice_item") do
      expect(page).not_to have_content("Paperclip")
      expect(page).not_to have_content("This is an artisinal paperclip")
      expect(page).not_to have_content("$50.00")
    end


    within(".invoice_total") do
      expect(page).to have_content("Total: $0.00")
    end
  end

end
