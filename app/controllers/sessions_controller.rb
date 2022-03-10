class SessionsController < ApplicationController
  before_action :redirect_logged_in, only: [:new, :create]

  def new; end

  def create
    user = User.find_by(username: params[:session][:username])
    if user&.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success]   = 'You have successfully logged in!'
      redirect_to root_path
    else
      flash.now[:error] = 'There is something wrong with your credentials!'
      render 'sessions/new'
    end
  end

  def destroy
    session[:user_id] = nil

    flash[:success] = 'You have successfully logged out!'
    redirect_to login_path
  end

  private

  def redirect_logged_in
    return unless logged_in?

    flash[:error] = 'You are already logged in'
    redirect_to root_path
  end
end
