class UsersController < ApplicationController
  def index
  end

  def new
  end

  def create
    @user = User.new(user_params)
    @user.password = params[:password]
    if @user.save
      session[:user_id] = @user._id.to_s
      render json: true
    else
      render json: false
    end
  end

  def show
    render json: current_user
  end

  def update
    current_user.update(user_params)
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

  private

  def user_params
    params.require(:user).permit(:username, :password, :first_name, :middle_initial, :last_name, :email, :phone_numbers, :city, :state, :zip, :created_at, :tour_votes)
  end
end
