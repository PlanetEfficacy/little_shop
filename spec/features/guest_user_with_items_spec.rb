# As a visitor when I have items in my cart
# And when I visit "/cart"
# I should not see an option to "Checkout"
# I should see an option to "Login or Create Account to Checkout"
# After I create an account
# And I visit "/cart
# Then I should see all of the data that was there when I was not logged in

RSpec.feature "guest user must create account to Checkout" do
  scenario "guest user can view the cart" do

    Fabricate(:item)

    visit items_path
    click_on "Add to Cart"
    visit cart_path

    expect(page).to_not have_link("Checkout", exact: true)

    click_on "Login or Create Account to Checkout"

    expect(current_path).to eq(login_path)

    click_on "Create Account"

    expect(current_path).to eq(new_user_path)

    fill_in "Username", with: "Kevin1"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"
    click_on "Create Account"

    # if there is something in the cart whenever you create an account, after you create the account, we send you to your cart

    expect(current_path).to eq(cart_path)
    expect(page).to have_css(".invoice_item")
    expect(page).to have_css(".thumbnail", count: 1)
  end
end
