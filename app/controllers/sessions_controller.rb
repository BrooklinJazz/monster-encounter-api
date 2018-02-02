class SessionsController < ApplicationController
  def new
  end
  def create
    user = User.find_by(email: session_params[:email])

    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      # current request and next request
      flash[:notice] = 'Thank you for sign in!'
      redirect_to home_path
    else
      # current request
      flash.now[:alert] = 'Wrong email or password!'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to home_path, notice: 'Signed Out!'
  end
end
