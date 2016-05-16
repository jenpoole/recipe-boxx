class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  # make methods available to all views
  helper_method :current_user, :logged_in?

  
  # find which user id is currently in session
  # store current user as variable for all views
  def current_user
    @current_user ||= Chef.find(session[:chef_id]) if session[:chef_id]
  end
  
  # check if current user is logged in (true or false)
  def logged_in?
    !!current_user
  end
  
  # Only logged in users can perform certain actions, such as creating & editing recipes
  # Users not logged in can only view recipe page and recipes index
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action"
      redirect_to :back
    end  
  end
end
