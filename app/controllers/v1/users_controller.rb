module V1
  class UsersController < ApplicationController
    def create 
      @user = User.new(user_params)

      if @user.save
        render :create 
      else
        head(:unprocessable_entity)  # status 422
      end
    end

    private

    def user_params 
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
end