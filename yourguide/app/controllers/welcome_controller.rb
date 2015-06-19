class WelcomeController < ApplicationController
  def index
    if session[:user_id]
      redirect "/users/#{session[:user_id]}"
    else
      erb :index
    end
  end

  def signin

    current_user
    session[:current_user] = User.find_by(username: params[:username])
  end

  def browse
  end
end
