class Item::ReviewsController < ApplicationController
  def create
    @item = Item.find(review_params[:item_id])
    @review = @item.reviews.new(body: review_params[:body],
                                stars: review_params[:stars].to_i,
                                user: current_user)
    if @review.save
      flash[:success] = "Your review has been submitted... maybe"
    else
      flash[:notice] = "Your review sucks, we have discarded it"
    end
    redirect_to item_path(@item)
  end

  private

  def review_params
    permitted = params.require(:review).permit(:body, :item_id)
    permitted[:stars] = params[:stars]
    permitted
  end
end
