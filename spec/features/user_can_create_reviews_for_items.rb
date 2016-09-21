require 'rails_helper'

RSpec.feature "item reviews" do
  scenario "logged in user adds a review to an item" do
    # As a logged in user
    # When I visit an item show page
    # Then I should expect to see a form to fill out a review
    # And I fill out the text area with my review
    # And I give it 4 stars
    # And I click "Submit Review"
    # Then I should expect to still be on the item show page
    # And I should see my review on the page
    # And I should expect to see the average stars for the item
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
