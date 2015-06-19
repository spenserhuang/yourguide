class WelcomeController < ApplicationController
  def index
    if user_logged_in?
      render json: current_user
    else
      render json: false
    end
  end

  def signin
    @user = User.find_by(username: params[:username])

    if @user.password == params[:password]
      session[:current_user] = User.find_by(username: params[:username])
      render json: current_user
    else
      render json: false
    end
  end

  def browse
  end
end
