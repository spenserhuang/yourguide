class ToursController < ApplicationController
  def index
  end

  def new
  end

  def create
    @tour = Tour.new(tour_params)
    if @tour.save
      session[:tour_id] = @tour._id.to_s
      render json: true
    else
      render json: false
    end
  end

  def show
    session[:tour_id] = Tour.find(params[:tour_id])
    render json: current_tour
  end

  def search
    @tours = Tour.where(params[:tour])
    render json: @tours
  end

  def update
    current_tour.update(tour_params)
    if current_tour.save
      render json: true
    else
      render json: false
    end
  end

  def destroy
    if current_tour.destroy
      render json: true
    else
      render json: false
    end
  end

  private

  def tour_params
    params.require(:tour).permit(:title, :city, :state, :zip, :coordinates, :video_url, :photo_urls, :content, :created_at, :tour_votes)
  end
end
