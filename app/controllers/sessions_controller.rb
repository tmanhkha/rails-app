class SessionsController < ApplicationController
  before_action :authentica_user, only: [:new]
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])
      log_in(user)
      flash[:notice] = "Sign in successfully"
      redirect_to root_path
    else
      flash.now[:alert] = 'Invalid email or password'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_url
  end

  def authentica_user
    if logged_in?
      flash[:alert] = "You have already sign in"
      redirect_to root_path
    end
  end
end
