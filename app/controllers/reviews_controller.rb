class ReviewsController < ApplicationController

  skip_before_action :require_login, only: [:review]

  def create
    @product = Product.find params[:product_id]
    @review = @product.reviews.new(reviews_params)
    @review.user_id = current_user.id

    if @review.save
      redirect_to product_path(@product)
    else
      redirect_to product_path(@product)
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to "/"
  end

  private

  def reviews_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to product_path(@product)
    end
  end

end



