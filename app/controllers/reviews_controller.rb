class ReviewsController < ApplicationController

  before_action :restrict_access
  
  before_action only: [:destroy, :update] do
    unless params[:user_name] == Review.find(params[:id]).user_name
      render status: 401, json: {
        message: "You do not have authorization to edit this review."
      }
    end
  end

  def index
    if params[:city]
      city_name = params[:city]
    end
    if params[:country]
      country_name = params[:country]
    end
    @reviews = Review.search(city_name, country_name).order(:city).page(params[:page])
    json_response(@reviews)
  end

  def most_popular
    @locations = Review.most_reviewed
    json_response(@locations)
  end

  def highest_rated
    @locations = Review.highest_rated
    json_response(@locations)
  end

  def create
    @review = Review.create!(review_params)
    json_response(@review, :created)
  end

  def show
    @review = Review.find(params[:id])
    json_response(@review)
  end

  def update
    @review = Review.find(params[:id])
    if @review.update!(review_params)
      render status: 200, json: {
        message: "Review updated successfully"
      }
    end
  end

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy!
      render status: 200, json: {
        message: "Review deleted"
      }
    end
  end

  def random
    # Loop through Review.all and grab the city value and push it to city_arrays
    city_array = []
    Review.all.each do | obj|
      city_array.push(obj[:city])
    end
    @reviews = Review.random_location(city_array)
    json_response(@reviews)
  end

  private
  def restrict_access
    api_key = ApiKey.find_by_access_token(params[:access_token])
    head :unauthorized unless api_key
  end

  # def restrict_access
  #   authenticate_or_request_with_http_token do |token, options|
  #   ActiveSupport::SecurityUtils.secure_compare(token, TOKEN)
  #     # ApiKey.exists?(access_token: token)
  #   end
  # end

  def review_params
    params.permit(:country, :city, :rating, :user_name, :content)
  end
end