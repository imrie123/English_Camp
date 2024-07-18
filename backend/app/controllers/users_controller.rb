class UsersController < ApplicationController

  def create
    @response = FirebaseService::SignUp.new(user_params[:email], user_params[:password]).call
    if @response["idToken"]
      @user = User.new(user_params)
      if @user.save

        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  end
  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end