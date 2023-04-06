class UsersController < ApplicationController
    skip_before_action :authorize, only: :create
  
    def create
      # creating new user with exception
      user = User.create!(user_params)
      # saving id  that I just created into a session hash.
      session[:user_id] = user.id
      # return json response
      render json: user, status: :created
    end
  
    def show
      render json: @current_user
    end
  
    private
  
    def user_params
      params.permit(:username, :password, :password_confirmation, :image_url, :bio)
    end
  
  end