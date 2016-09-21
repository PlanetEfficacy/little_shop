RSpec.feature "guest user must create account to Checkout" do
  scenario "guest user can view the cart" do
    Fabricate(:item)

    visit items_path
    click_on "Add to Cart"
    visit cart_path
    expect(page).to_not have_button("Checkout", exact: true)

    click_on "Login or Create Account to Checkout"
    expect(current_path).to eq(login_path)

    click_link "Create Account"
    expect(current_path).to eq(new_user_path)

    fill_in "Username", with: "Kevin1"
    fill_in "Password", with: "password1"
    fill_in "Password confirmation", with: "password1"

    fill_in "First name", with: "Kevin"
    fill_in "Last name", with: "Smith"
    fill_in "Street address", with: "123 Main St."
    fill_in "City", with: "Anytown"
    select "Ohio", :from => "state"
    fill_in "Zipcode", with: "10001"

    click_button "Create Account"

    visit cart_path
    expect(page).to have_css(".invoice_item")
    expect(page).to have_css(".thumbnail", count: 1)
  end
end
