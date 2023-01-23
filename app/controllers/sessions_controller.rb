class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    # if the user exists AND the password entered is correct
    if user && user.authenticate(params[:password])
      # Save the user id inside the browser cookie
      # keeps user logged in when they navigate around our website
      session[:user_id] = user.id
      redirect_to '/'
    else
    # if user login doesn't work, send back to login form
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

end
