class LoginsController < ApplicationController
  
  # new user log in session
  def new 
  end
  
  # create login session
  def create
    #find user by email
    chef = Chef.find_by(email: params[:email]) 
    
    # authenticate user by password
    # if user is able to log in, redirect to recipes index & store chef_id in browser session
    # otherwise, show error and render log in form again
    if chef && chef.authenticate(params[:password])
      session[:chef_id] = chef.id
      flash[:success] = "You are logged in"
      redirect_to recipes_path
    else
      flash.now[:danger] = "Your email address or password does not match"
      render 'new'
    end
  end
  
  # end user login session
  def destroy
    session[:chef_id] = nil
    flash[:success] = "You have logged out"
    redirect_to root_path
  end
  
end