class PagesController < ApplicationController
  
  # display main page
  # if user is logged in, display recipes index
  # otherwise, display welcome page
  def home
    redirect_to recipes_path if logged_in?
  end
end