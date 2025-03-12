class Api::V1::CafesController < ApplicationController

  def index
    if params[:title].present?
      # display the cafes filtered by the search
      @cafes = Cafe.where('title ILIKE ?', "%#{params[:title]}%")
    else
      @cafes = Cafe.all
    end
    # Putting the most recently created cafes first
    render json: @cafes.order(created_at: :desc)
  end

  def create
    @cafe = Cafe.new(cafe_params)
    if @cafe.save
      #redirect to the index the cafes_path
      render json: @cafe, status: :created
    else
      #display an error
      render json: { errors: @cafe.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def cafe_params
    params.require(:cafe).permit(:title, :address, :picture, hours: {}, criteria: [])
  end

end
