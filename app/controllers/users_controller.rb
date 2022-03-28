class UsersController < ApplicationController
  def new; end

  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = 'Successfully created new account'
    else
      flash[:error] = 'Failed to create new account'
    end
    redirect_to login_url
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
