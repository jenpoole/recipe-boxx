class ChefsController < ApplicationController
  before_action :find_chef, only: [:show, :edit, :update, :destroy]
  
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
      redirect_to recipes_path
    else
      render 'new'
    end
  end
  
  # edit chef profile
  def edit 
  end
  
  def update
    
    if @chef.update(chef_params)
      flash[:success] = "Your profile has been updated successfully."
      redirect_to recipes_path #change redirect to chef show page later
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
  
end