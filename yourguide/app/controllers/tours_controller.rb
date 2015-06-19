class ToursController < ApplicationController
  def index
  end

  def new
  end

  def create
    @tour = Tour.new(params[:tour])
    if @tour.save
      render json: true
    else
      render json: false
    end
  end

  def show
    render json: current_tour
  end

  def search
    @tours = Tour.where(params[:tour])
    render json: @tours
  end

  def update
    current_tour.update(params[:tour])
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
end
