require 'rails_helper'

RSpec.feature "item reviews" do
  def user_adds_item_review
    @item = Fabricate(:item)
    @user = Fabricate(:user)
    login_as(@user)
    visit item_path(@item)

    fill_in_review_body
    select_stars(4)
    click_button "Submit Review"
    expect(current_path).to eq(item_path(@item))
  end

  scenario "logged in user adds a review to an item" do
    user_adds_item_review

    within ".review" do
      expect(page).to have_content("This is my review.")
      expect(page).to have_content(@user.username)
      expect(page).to have_content(@user.reviews.last.created_at)
      expect(page).to have_css(".glyphicon-star", count: 4)
      expect(page).to have_css(".glyphicon-star-empty", count: 1)
    end

    expect(page).to have_content("Average Rating: 4.0")
  end

  scenario "visitor can see all reviews of an item" do
    user_adds_item_review
    click_link("Logout")

    visit item_path(@item)

    expect(page).not_to have_css('.new_review > form')
    expect(page).to have_content("Average Rating: 4.0")
    expect(page).to have_css(".reviews")

    within ".review" do
      expect(page).to have_content(@user.username)
      expect(page).to have_css(".glyphicon-star", count: 4)
      expect(page).to have_css(".glyphicon-star-empty", count: 1)
      expect(page).to have_content(@user.reviews.last.created_at)
    end
  end

  scenario "logged in user can delete their own review" do
    user_adds_item_review
    click_button "Delete Review"

    expect(current_path).to eq(item_path(@item))
    expect(page).not_to have_content("This is my review.")
  end

  scenario "visitor cannot delete a review" do
    user_adds_item_review
    click_link("Logout")

    visit item_path(@item)
    expect(page).not_to have_button("Delete Review")
  end
end
