class ChefsController < ApplicationController
  
  before_action :find_chef, only: [:show, :edit, :update, :destroy] # find chef before showing or editing
  before_action :require_same_user, only: [:edit, :update]          # user can only edit their own profile
  
  # display paginated list of all chefs on chef index
  def index 
    @chefs = Chef.paginate(page: params[:page], per_page: 5)
  end
  
  # register new chef account
  def new
    @chef = Chef.new
  end
  
  def create
    @chef = Chef.new(chef_params)
    
    if @chef.save
      flash[:success] = "Your account has been created successfully."
      session[:chef_id] = @chef.id # start user login session when user creates an account
      redirect_to recipes_path
    else
      render 'new'
    end
  end
  
  # edit chef profile
  def edit 
  end
  
  # if chef profile is updated, save and redirect to chef page
  # otherwise, render edit form again
  def update
    if @chef.update(chef_params)
      flash[:success] = "Your profile has been updated successfully."
      redirect_to chef_path(current_user) # redirect to chef show page
    else
      render 'edit'
    end
  end
  
  # show chef profile
  def show
    @recipes = @chef.recipes.paginate(page: params[:page], per_page: 3) #paginate recipes shown on chef's page
  end
  
  
  private
  
    def chef_params
      params.require(:chef).permit(:chefname, :email, :password)
    end
    
    def find_chef
      @chef = Chef.find(params[:id])
    end
    
    # logged in user can only edit their own profile
    def require_same_user
      if current_user != @chef
        flash[:danger] = "You can only edit your own profile"
        redirect_to :back
      end  
    end
  
end