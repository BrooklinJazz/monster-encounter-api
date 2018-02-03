class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
    @current_user ||=User.find_by(id: session[:user_id])
  end
  helper_method :current_user
  # added
  def user_signed_in?
    # the following is to prevent the app from crashing if we have
    # a 'user_id' in the session for a user that no loner exists
    # in our database. Maybe the user was deleted or maybe our database
    # was reseeded
    if session[:user_id].present? && curent_user.nil?
      # if you don't do this you will get an error
      session[:user_id] = nil
    end
    session[:user_id].present?
  end
  helper_method :user_signed_in?

  private
  def authenticate_user!
    unless user_signed_in
      redirect_to new_session_path, alert: 'You must sign in or sign up first!'
    end
  end
end
