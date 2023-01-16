require "#{Rails.root}/lib/JsonWebToken"

class Api::UsersController < ApplicationController

  #
  def register
    @user = User.new(user_params)
    @user['role'] = 'JobSeeker'
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by_Email(user_params[:Email])
    if @user
      if @user.authenticate(user_params[:password])
        render json: {jwtToken: JsonWebToken.encode({UserID: @user['id']})},status:200
      else
        render json: {Error: "Wrong password"},status:401
      end
    else
      render json: {Error: "Not found"},status:401
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:Email, :password)
    end
end