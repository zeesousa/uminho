# == Schema Information
#
# Table name: reviews
#
#  id         :integer          not null, primary key
#  text       :text
#  score      :integer
#  likes      :integer
#  dislikes   :integer
#  user_id    :integer
#  product_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ReviewsController < ApplicationController
  load_and_authorize_resource
  before_filter :set_product, only: [:index, :new, :create]
  before_filter :set_review, only: [:like, :dislike]

  def index
    @reviews = @product.reviews
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.product = @product
    @review.user = current_user

    respond_to do |format|
      if @review.save
        format.html do
          flash[:notice] = 'Review was successfully created.'
          redirect_to request.referer
        end
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new}
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  def like
    @review.liked_by current_user
    redirect_to request.referer
  end

  def dislike
    @review.disliked_by current_user
    redirect_to request.referer
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:text, :score)
  end
end
