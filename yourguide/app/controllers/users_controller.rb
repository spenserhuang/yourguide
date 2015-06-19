class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:password]
    if @user.save
      render json: true
    else
      render json: false
    end
  end

  def show
    render json: current_user
  end

  def update
    current_user.update(params[:user])
    if current_user.save
      render json: true
    else
      render json: false
    end
  end

  def destroy
    if current_user.destroy
      render json: true
    else
      render json: false
    end
  end
end
