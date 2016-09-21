require 'rails_helper'

RSpec.feature "item reviews" do
  scenario "logged in user adds a review to an item" do
    user = Fabricate(:user)
    # As a logged in user
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Login"
    # When I visit an item show page
    item = Fabricate(:item)
    visit item_path(item)
    # Then I should expect to see a form to fill out a review
    expect(page).to have_css('.new_review > form')
    # And I fill out the text area with my review
    fill_in "Body", with: "This is my review."
    # And I give it 4 stars
    # save_and_open_page
    select 4, from: "stars"
    # And I click "Submit Review"
    click_button "Submit Review"
    # Then I should expect to still be on the item show page
    expect(current_path).to eq(item_path(item))
    # And I should see my review on the page
    within ".review" do
      expect(page).to have_content("This is my review.")
    # And I should expect to see my username on the page
      expect(page).to have_content(user.username)
    # And I should expect to see when it was created
      expect(page).to have_content(user.reviews.last.created_at)
    # And I should expect to see the number of stars I gave it
      expect(page).to have_css(".glyphicon-star", count: 4)
      expect(page).to have_css(".glyphicon-star-empty", count: 1)
    end
    # I should also see the average star rating for the item
    expect(page).to have_content("Average Rating: 4.0")
  end


  scenario "visitor can see all reviews of an item" do
    # When I visit an item show page that has reviews
    # I should not expect to see a form to fill out a review
    # I expect to an average star rating for the item
    # And I should expect to see the item's reviews
    # And for each review, I should see:
    # - The username who created the review
    # - How many stars they gave it
    # - When the review was created
    end

  scenario "logged in user can edit their own review" do
    # As a logged in user
    # When I leave a review for an item
    # And I visit an item show page
    # And I click 'Modify Review'
    # I should expect to see a form with my review content in it
    # And if I edit the form to change my review
    # And I edit the amount of stars I give it
    # And click button 'Update Review'
    # I should expect to be back on the item show page
    # And I should expect to see my updated review
    # And I should see the updated star count
    # And I should expect to see the average star count to have changed
  end

  scenario "logged in user can delete their own review" do
    # As a logged in user that has left a review for an item
    # And I visit that item's show page
    # And I click 'Delete Review'
    # I should be on the item show page
    # I should not expect to my review on the page
  end
end
